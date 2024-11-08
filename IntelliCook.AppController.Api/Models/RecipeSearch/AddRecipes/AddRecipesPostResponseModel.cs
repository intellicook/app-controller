using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.AddRecipes;

public class AddRecipesPostResponseModel
{
    [Required] public IEnumerable<AddRecipesResponseRecipeModel> Recipes { get; set; }
}