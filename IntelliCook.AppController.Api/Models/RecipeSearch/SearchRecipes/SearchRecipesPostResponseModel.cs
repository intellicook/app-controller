using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipes;

public class SearchRecipesPostResponseModel
{
    [Required] public IEnumerable<SearchRecipesRecipeModel> Recipes { get; set; }
}