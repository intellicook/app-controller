using Grpc.Core;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.Health;
using IntelliCook.Auth.Client;
using IntelliCook.RecipeSearch.Client;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using System.Net;

namespace IntelliCook.AppController.Api.Controllers;

[Route("[controller]")]
[ApiController]
[AllowAnonymous]
public class HealthController(
    IAuthClient authClient,
    RecipeSearchService.RecipeSearchServiceClient recipeSearchClient
) : ControllerBase
{
    /// <summary>
    /// Checks the health of App Controller and its components.
    /// </summary>
    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<HealthGetResponseModel>), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(IEnumerable<HealthGetResponseModel>), StatusCodes.Status503ServiceUnavailable)]
    public async Task<IActionResult> Get()
    {
        var result = new List<HealthGetResponseModel>();

        // Auth health
        IAuthClient.Result<
            IntelliCook.Auth.Contract.Health.HealthGetResponseModel,
            IntelliCook.Auth.Contract.Health.HealthGetResponseModel
        >? authResponse = null;
        try
        {
            authResponse = await authClient.GetHealthAsync();
        }
        catch (HttpRequestException)
        {
        }

        result.Add(authResponse?.StatusCode switch
        {
            HttpStatusCode.OK => authResponse.Value.ToHealthGetResponseModel(),
            HttpStatusCode.ServiceUnavailable when authResponse.HasError =>
                authResponse.Error.ToHealthGetResponseModel(),
            _ => new HealthGetResponseModel
            {
                Service = HealthServiceModel.Auth,
                Status = HealthStatusModel.Unhealthy,
                Checks = []
            }
        });

        // Recipe Search health
        HealthResponse? recipeSearchResponse = null;
        try
        {
            recipeSearchResponse = await recipeSearchClient.GetHealthAsync(new HealthRequest());
        }
        catch (RpcException)
        {
        }

        result.Add(recipeSearchResponse switch
        {
            not null => recipeSearchResponse.ToHealthGetResponseModel(),
            _ => new HealthGetResponseModel
            {
                Service = HealthServiceModel.RecipeSearch,
                Status = HealthStatusModel.Unhealthy,
                Checks = []
            }
        });

        return result.Any(h => h.Status != HealthStatusModel.Healthy) switch
        {
            true => StatusCode(StatusCodes.Status503ServiceUnavailable, result),
            false => Ok(result)
        };
    }
}