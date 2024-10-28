using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipesByIngredients;
using IntelliCook.Auth.Client;
using IntelliCook.RecipeSearch.Client;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace IntelliCook.AppController.Api.Controllers.RecipeSearch;

[Tags("RecipeSearch")]
[Route("User/[controller]")]
[ApiController]
[AllowAnonymous]
public class SearchRecipesByIngredientsController(
    IAuthClient authClient,
    RecipeSearchService.RecipeSearchServiceClient recipeSearchClient
) : ControllerBase
{
    /// <summary>
    ///     Search recipes by ingredients.
    /// </summary>
    [HttpPost]
    [ProducesResponseType(typeof(SearchRecipesByIngredientsPostResponseModel), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(ValidationProblemDetails), StatusCodes.Status400BadRequest)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(typeof(ProblemDetails), StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Post(SearchRecipesByIngredientsPostRequestModel request)
    {
        var userResult = await authClient.GetUserMeAsync();
        var user = userResult.TryValue;

        if (user is null)
        {
            return userResult.ToObjectResult();
        }

        var rpcRequest = new SearchRecipesByIngredientsRequest();

        rpcRequest.Username = user.Username;

        if (request.Limit != null)
        {
            rpcRequest.Limit = request.Limit.Value;
        }

        rpcRequest.Ingredients.AddRange(request.Ingredients);

        var result = await recipeSearchClient.SearchRecipesByIngredientsAsync(rpcRequest);
        return Ok(result.ToPostResponseModel());
    }
}