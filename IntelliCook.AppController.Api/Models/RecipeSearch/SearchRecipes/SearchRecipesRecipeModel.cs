using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipes;

public class SearchRecipesRecipeModel
{
    [Required] public int Id { get; set; }

    [Required] public string Title { get; set; }

    [Required] public string Description { get; set; }

    [Required] public IEnumerable<SearchRecipesRecipeIngredientModel> Ingredients { get; set; }

    [Required] public IEnumerable<SearchRecipesMatchModel> Matches { get; set; }

    public SearchRecipesRecipeDetailModel? Detail { get; set; }
}