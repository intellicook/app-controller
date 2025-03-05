using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models;
using IntelliCook.AppController.Api.Models.RecipeSearch.UserProfile;
using IntelliCook.Auth.Client;
using IntelliCook.RecipeSearch.Client;
using Microsoft.AspNetCore.Mvc;

namespace IntelliCook.AppController.Api.Controllers.RecipeSearch;

[Tags("RecipeSearch")]
[Route("RecipeSearch/[controller]")]
[ApiController]
public class UserProfileController(
    IAuthClient authClient,
    RecipeSearchService.RecipeSearchServiceClient recipeSearchClient
) : ControllerBase
{
    /// <summary>
    ///     Get user profile.
    /// </summary>
    [HttpGet]
    [ProducesResponseType(typeof(UserProfileGetResponseModel), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(typeof(ProblemDetailsModel), StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Get()
    {
        var userResult = await authClient.GetUserMeAsync();
        var user = userResult.TryValue;

        if (user is null)
        {
            return userResult.ToObjectResult();
        }

        var rpcRequest = new UserProfileRequest
        {
            Username = user.Username
        };

        var result = await recipeSearchClient.GetUserProfileAsync(rpcRequest);
        return Ok(result.ToGetResponseModel());
    }
}