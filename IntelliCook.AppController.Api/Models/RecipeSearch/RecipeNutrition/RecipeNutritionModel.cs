using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.RecipeNutrition;

public class RecipeNutritionModel
{
    [Required] public RecipeNutritionValueModel Calories { get; set; }

    [Required] public RecipeNutritionValueModel Fat { get; set; }

    [Required] public RecipeNutritionValueModel Protein { get; set; }

    [Required] public RecipeNutritionValueModel Carbs { get; set; }
}