using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.Health;
using IntelliCook.Auth.Client;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using System.Net;

namespace IntelliCook.AppController.Api.Controllers;

[Route("[controller]")]
[ApiController]
[AllowAnonymous]
public class HealthController(HealthCheckService healthCheckService, IAuthClient authClient) : ControllerBase
{
    /// <summary>
    /// Checks the health of App Controller and its components.
    /// </summary>
    [HttpGet]
    [ProducesResponseType(typeof(IEnumerable<HealthGetResponseModel>), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(IEnumerable<HealthGetResponseModel>), StatusCodes.Status503ServiceUnavailable)]
    public async Task<IActionResult> Get()
    {
        var report = await healthCheckService.CheckHealthAsync();
        var result = new List<HealthGetResponseModel>();

        // App Controller health
        result.Add(new HealthGetResponseModel
        {
            Status = report.Status.ToHealthStatusModel(),
            Checks = report.Entries.Select(entry => new HealthCheckModel
            {
                Name = entry.Key,
                Status = entry.Value.Status.ToHealthStatusModel()
            })
        });

        // Auth health
        var authResponse = await authClient.GetHealth();
        result.Add(authResponse.StatusCode switch
        {
            HttpStatusCode.OK => authResponse.Value.ToHealthGetResponseModel(),
            HttpStatusCode.ServiceUnavailable when authResponse.HasError =>
                authResponse.Error.ToHealthGetResponseModel(),
            _ => new HealthGetResponseModel
            {
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