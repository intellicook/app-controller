using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipesByIngredients;

public class SearchRecipesByIngredientsPostResponseModel
{
    [Required]
    public IEnumerable<SearchRecipesByIngredientsRecipeModel> Recipes { get; set; }
}