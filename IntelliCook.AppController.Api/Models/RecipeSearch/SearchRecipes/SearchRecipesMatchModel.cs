using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipes;

public class SearchRecipesMatchModel
{
    [Required] public SearchRecipesMatchFieldModel Field { get; set; }

    [Required] public IEnumerable<string> Tokens { get; set; }

    public int? Index { get; set; }
}