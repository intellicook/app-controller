using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models;
using IntelliCook.AppController.Api.Models.RecipeSearch.AddRecipes;
using IntelliCook.AppController.Api.Models.RecipeSearch.RecipeNutrition;
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

            rpcRecipe.Title = recipe.Title;
            rpcRecipe.Description = recipe.Description;
            rpcRecipe.Ingredients.AddRange(recipe.Ingredients.Select(i =>
            {
                var rpcIngredient = new AddRecipesRecipeIngredient();

                rpcIngredient.Name = i.Name;

                if (i.Quantity is not null)
                {
                    rpcIngredient.Quantity = i.Quantity.Value;
                }

                if (i.Unit is not null)
                {
                    rpcIngredient.Unit = i.Unit;
                }

                return rpcIngredient;
            }));
            rpcRecipe.Directions.AddRange(recipe.Directions);
            rpcRecipe.Tips.AddRange(recipe.Tips);
            rpcRecipe.Utensils.AddRange(recipe.Utensils);
            rpcRecipe.Nutrition = new RecipeNutrition();
            rpcRecipe.Nutrition.Calories = ToNutritionValue(recipe.Nutrition.Calories);
            rpcRecipe.Nutrition.Fat = ToNutritionValue(recipe.Nutrition.Fat);
            rpcRecipe.Nutrition.Protein = ToNutritionValue(recipe.Nutrition.Protein);
            rpcRecipe.Nutrition.Carbs = ToNutritionValue(recipe.Nutrition.Carbs);

            return rpcRecipe;
        }));

        var result = await recipeSearchClient.AddRecipesAsync(rpcRequest);
        return Ok(result.ToPostResponseModel());
    }

    #region RecipeNutritionValue Conversion

    public static RecipeNutritionValue ToNutritionValue(
        RecipeNutritionValueModel nutritionValue
    )
    {
        return nutritionValue switch
        {
            RecipeNutritionValueModel.High => RecipeNutritionValue.High,
            RecipeNutritionValueModel.Medium => RecipeNutritionValue.Medium,
            RecipeNutritionValueModel.Low => RecipeNutritionValue.Low,
            RecipeNutritionValueModel.None => RecipeNutritionValue.None,
            _ => throw new ArgumentOutOfRangeException()
        };
    }

    #endregion RecipeNutritionValue Conversion
}