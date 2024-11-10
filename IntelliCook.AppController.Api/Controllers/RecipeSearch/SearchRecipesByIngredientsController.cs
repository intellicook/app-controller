using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models;
using IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipesByIngredients;
using IntelliCook.Auth.Client;
using IntelliCook.RecipeSearch.Client;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace IntelliCook.AppController.Api.Controllers.RecipeSearch;

[Tags("RecipeSearch")]
[Route("RecipeSearch/[controller]")]
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
    [ProducesResponseType(typeof(ValidationProblemDetailsModel), StatusCodes.Status400BadRequest)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(typeof(ProblemDetailsModel), StatusCodes.Status404NotFound)]
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

        if (request.Limit is not null)
        {
            rpcRequest.Limit = request.Limit.Value;
        }

        if (request.IncludeDetail is not null)
        {
            rpcRequest.IncludeDetail = request.IncludeDetail.Value;
        }

        rpcRequest.Ingredients.AddRange(request.Ingredients);

        var result = await recipeSearchClient.SearchRecipesByIngredientsAsync(rpcRequest);
        return Ok(result.ToPostResponseModel());
    }
}