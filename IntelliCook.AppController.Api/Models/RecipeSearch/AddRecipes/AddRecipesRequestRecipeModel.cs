using IntelliCook.AppController.Api.Models.RecipeSearch.RecipeNutrition;
using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.AddRecipes;

public class AddRecipesRequestRecipeModel
{
    [Required] public string Title { get; set; }

    [Required] public string Description { get; set; }

    [Required] public IEnumerable<AddRecipesRecipeIngredientModel> Ingredients { get; set; }

    [Required] public IEnumerable<string> Directions { get; set; }

    [Required] public IEnumerable<string> Tips { get; set; }

    [Required] public IEnumerable<string> Utensils { get; set; }

    [Required] public RecipeNutritionModel Nutrition { get; set; }
}