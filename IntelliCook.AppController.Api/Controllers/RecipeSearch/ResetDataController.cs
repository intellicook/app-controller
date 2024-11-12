using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models;
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
public class ResetDataController(
    IAuthClient authClient,
    RecipeSearchService.RecipeSearchServiceClient recipeSearchClient
) : ControllerBase
{
    /// <summary>
    ///     Reset all data in the recipe search service, use with caution.
    /// </summary>
    /// <remarks>
    ///    Only admins can reset data.
    /// </remarks>
    [HttpDelete]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(typeof(ForbiddenModel), StatusCodes.Status403Forbidden)]
    [ProducesResponseType(typeof(ProblemDetailsModel), StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Delete()
    {
        var userResult = await authClient.GetUserMeAsync();
        var user = userResult.TryValue;

        if (user is null)
        {
            return userResult.ToObjectResult();
        }

        if (user.Role != UserRoleModel.Admin)
        {
            return this.Forbidden("Only admins can reset data.");
        }

        var rpcRequest = new ResetDataRequest();

        await recipeSearchClient.ResetDataAsync(rpcRequest);

        return NoContent();
    }
}