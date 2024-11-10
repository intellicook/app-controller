using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipesByIngredients;

public class SearchRecipesByIngredientsRecipeDetailModel
{
    [Required] public IEnumerable<string> Ingredients { get; set; }

    [Required] public IEnumerable<string> Instructions { get; set; }

    [Required] public string Raw { get; set; }
}