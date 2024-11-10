using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models;
using IntelliCook.AppController.Api.Models.RecipeSearch.FaissIndexThread;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.RecipeSearch.Client;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace IntelliCook.AppController.Api.Controllers.RecipeSearch;

[Tags("RecipeSearch")]
[Route("RecipeSearch/[controller]")]
[ApiController]
[AllowAnonymous]
public class FaissIndexThreadController(
    IAuthClient authClient,
    RecipeSearchService.RecipeSearchServiceClient recipeSearchClient
) : ControllerBase
{
    /// <summary>
    ///     Get Faiss index thread status.
    /// </summary>
    /// <remarks>
    ///     Only admins can initialize Faiss index.
    /// </remarks>
    [HttpGet]
    [ProducesResponseType(typeof(FaissIndexThreadGetResponseModel), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(typeof(ForbiddenModel), StatusCodes.Status403Forbidden)]
    [ProducesResponseType(typeof(ProblemDetailsModel), StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Get()
    {
        var userResult = await authClient.GetUserMeAsync();
        var user = userResult.TryValue;

        if (user is null)
        {
            return userResult.ToObjectResult();
        }

        if (user.Role != UserRoleModel.Admin)
        {
            return this.Forbidden("Only admins can get Faiss index thread status.");
        }

        var rpcRequest = new FaissIndexThreadRequest();

        var result = await recipeSearchClient.GetFaissIndexThreadAsync(rpcRequest);

        return Ok(result.ToGetResponseModel());
    }
}