using IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipesByIngredients;
using IntelliCook.RecipeSearch.Client;

namespace IntelliCook.AppController.Api.Extensions;

public static class RecipeSearchExtensions
{
    public static SearchRecipesByIngredientsPostResponseModel ToPostResponseModel(
        this SearchRecipesByIngredientsResponse response
    )
    {
        return new SearchRecipesByIngredientsPostResponseModel
        {
            Recipes = response.Recipes.Select(r => r.ToRecipeModel())
        };
    }

    public static SearchRecipesByIngredientsRecipeModel ToRecipeModel(
        this SearchRecipesByIngredientsRecipe recipe
    )
    {
        return new SearchRecipesByIngredientsRecipeModel
        {
            Id = recipe.Id,
            Distance = recipe.Distance,
            Name = recipe.Name
        };
    }
}