using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipes;

public class SearchRecipesRecipeIngredientModel
{
    [Required] public string Name { get; set; }

    public float? Quantity { get; set; }

    public string? Unit { get; set; }
}