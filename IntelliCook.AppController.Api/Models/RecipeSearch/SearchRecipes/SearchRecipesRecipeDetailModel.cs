using IntelliCook.AppController.Api.Models.RecipeSearch.RecipeNutrition;
using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipes;

public class SearchRecipesRecipeDetailModel
{
    [Required] public IEnumerable<string> Directions { get; set; }

    [Required] public IEnumerable<string> Tips { get; set; }

    [Required] public IEnumerable<string> Utensils { get; set; }

    [Required] public RecipeNutritionModel Nutrition { get; set; }
}