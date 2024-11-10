using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models;
using IntelliCook.AppController.Api.Models.RecipeSearch.AddRecipes;
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
public class AddRecipesController(
    IAuthClient authClient,
    RecipeSearchService.RecipeSearchServiceClient recipeSearchClient
) : ControllerBase
{
    /// <summary>
    ///     Add a list of recipes.
    /// </summary>
    /// <remarks>
    ///     Only admins can add recipes.
    /// </remarks>
    [HttpPost]
    [ProducesResponseType(typeof(AddRecipesPostResponseModel), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(ValidationProblemDetailsModel), StatusCodes.Status400BadRequest)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(typeof(ForbiddenModel), StatusCodes.Status403Forbidden)]
    [ProducesResponseType(typeof(ProblemDetailsModel), StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Post(AddRecipesPostRequestModel request)
    {
        var userResult = await authClient.GetUserMeAsync();
        var user = userResult.TryValue;

        if (user is null)
        {
            return userResult.ToObjectResult();
        }

        if (user.Role != UserRoleModel.Admin)
        {
            return this.Forbidden("Only admins can add recipes.");
        }

        var rpcRequest = new AddRecipesRequest();

        rpcRequest.Recipes.AddRange(request.Recipes.Select(recipe =>
        {
            var rpcRecipe = new AddRecipesRequestRecipe();

            rpcRecipe.Name = recipe.Name;
            rpcRecipe.Ingredients.AddRange(recipe.Ingredients);
            rpcRecipe.Instructions.AddRange(recipe.Instructions);

            if (recipe.Raw is not null)
            {
                rpcRecipe.Raw = recipe.Raw;
            }

            return rpcRecipe;
        }));

        var result = await recipeSearchClient.AddRecipesAsync(rpcRequest);
        return Ok(result.ToPostResponseModel());
    }
}