using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipesByIngredients;

public class SearchRecipesByIngredientsRecipeModel
{
    [Required] public int Id { get; set; }

    [Required] public string Name { get; set; }

    public SearchRecipesByIngredientsRecipeDetailModel? Detail { get; set; }
}