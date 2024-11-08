using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.AddRecipes;

public class AddRecipesPostRequestModel
{
    [Required] public IEnumerable<AddRecipesRequestRecipeModel> Recipes { get; set; }
}