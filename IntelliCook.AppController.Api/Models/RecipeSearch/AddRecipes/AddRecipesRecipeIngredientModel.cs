using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.AddRecipes;

public class AddRecipesRecipeIngredientModel
{
    [Required] public string Name { get; set; }

    public float? Quantity { get; set; }

    public string? Unit { get; set; }
}