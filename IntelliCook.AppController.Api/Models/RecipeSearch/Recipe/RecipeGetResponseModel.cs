using IntelliCook.AppController.Api.Models.RecipeSearch.RecipeNutrition;
using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.Recipe;

public class RecipeGetResponseModel
{
    [Required] public int Id { get; set; }

    [Required] public string Title { get; set; }

    [Required] public string Description { get; set; }

    [Required] public IEnumerable<RecipeRecipeIngredientModel> Ingredients { get; set; }

    [Required] public IEnumerable<string> Directions { get; set; }

    [Required] public IEnumerable<string> Tips { get; set; }

    [Required] public IEnumerable<string> Utensils { get; set; }

    [Required] public RecipeNutritionModel Nutrition { get; set; }
}