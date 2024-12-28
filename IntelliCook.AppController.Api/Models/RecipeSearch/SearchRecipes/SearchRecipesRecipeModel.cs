using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipes;

public class SearchRecipesRecipeModel
{
    [Required] public int Id { get; set; }

    [Required] public string Name { get; set; }

    [Required] public IEnumerable<string> Ingredients { get; set; }

    [Required] public IEnumerable<SearchRecipesMatchModel> Matches { get; set; }

    public SearchRecipesRecipeDetailModel? Detail { get; set; }
}