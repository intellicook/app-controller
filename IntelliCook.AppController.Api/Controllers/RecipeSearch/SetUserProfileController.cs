using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models;
using IntelliCook.AppController.Api.Models.RecipeSearch.SetUserProfile;
using IntelliCook.AppController.Api.Models.RecipeSearch.UserProfile;
using IntelliCook.Auth.Client;
using IntelliCook.RecipeSearch.Client;
using Microsoft.AspNetCore.Mvc;

namespace IntelliCook.AppController.Api.Controllers.RecipeSearch;

[Tags("RecipeSearch")]
[Route("RecipeSearch/[controller]")]
[ApiController]
public class SetUserProfileController(
    IAuthClient authClient,
    RecipeSearchService.RecipeSearchServiceClient recipeSearchClient
) : ControllerBase
{
    /// <summary>
    ///     Set user profile.
    /// </summary>
    [HttpPost]
    [ProducesResponseType(typeof(SetUserProfilePostResponseModel), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(ValidationProblemDetailsModel), StatusCodes.Status400BadRequest)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(typeof(ProblemDetailsModel), StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Post(SetUserProfilePostRequestModel request)
    {
        var userResult = await authClient.GetUserMeAsync();
        var user = userResult.TryValue;

        if (user is null)
        {
            return userResult.ToObjectResult();
        }

        var rpcRequest = new SetUserProfileRequest();

        rpcRequest.Username = user.Username;
        rpcRequest.VeggieIdentity = request.VeggieIdentity switch
        {
            UserProfileVeggieIdentityModel.None => UserProfileVeggieIdentity.None,
            UserProfileVeggieIdentityModel.Vegetarian => UserProfileVeggieIdentity.Vegetarian,
            UserProfileVeggieIdentityModel.Vegan => UserProfileVeggieIdentity.Vegan,
            _ => throw new ArgumentOutOfRangeException()
        };
        rpcRequest.Prefer.AddRange(request.Prefer);
        rpcRequest.Dislike.AddRange(request.Dislike);

        var rpcResponse = await recipeSearchClient.SetUserProfileAsync(rpcRequest);

        return Ok(rpcResponse.ToPostResponseModel());
    }
}