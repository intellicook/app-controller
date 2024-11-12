using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipes;

public class SearchRecipesRecipeDetailModel
{
    [Required] public IEnumerable<string> Instructions { get; set; }

    [Required] public string Raw { get; set; }
}