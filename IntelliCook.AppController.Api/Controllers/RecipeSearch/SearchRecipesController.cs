using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models;
using IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipes;
using IntelliCook.Auth.Client;
using IntelliCook.RecipeSearch.Client;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace IntelliCook.AppController.Api.Controllers.RecipeSearch;

[Tags("RecipeSearch")]
[Route("RecipeSearch/[controller]")]
[ApiController]
[AllowAnonymous]
public class SearchRecipesController(
    IAuthClient authClient,
    RecipeSearchService.RecipeSearchServiceClient recipeSearchClient
) : ControllerBase
{
    /// <summary>
    ///     Search for recipes.
    /// </summary>
    [HttpPost]
    [ProducesResponseType(typeof(SearchRecipesPostResponseModel), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(ValidationProblemDetailsModel), StatusCodes.Status400BadRequest)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(typeof(ProblemDetailsModel), StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Post(SearchRecipesPostRequestModel request)
    {
        var userResult = await authClient.GetUserMeAsync();
        var user = userResult.TryValue;

        if (user is null)
        {
            return userResult.ToObjectResult();
        }

        var rpcRequest = new SearchRecipesRequest();

        rpcRequest.Username = user.Username;

        if (request.ExtraTerms is not null)
        {
            rpcRequest.ExtraTerms = request.ExtraTerms;
        }

        if (request.Page is not null)
        {
            rpcRequest.Page = request.Page.Value;
        }

        if (request.PerPage is not null)
        {
            rpcRequest.PerPage = request.PerPage.Value;
        }

        if (request.IncludeDetail is not null)
        {
            rpcRequest.IncludeDetail = request.IncludeDetail.Value;
        }

        rpcRequest.Ingredients.AddRange(request.Ingredients);

        var result = await recipeSearchClient.SearchRecipesAsync(rpcRequest);
        return Ok(result.ToPostResponseModel());
    }
}