using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.AddRecipes;

public class AddRecipesRequestRecipeModel
{
    [Required] public string Name { get; set; }

    [Required] public IEnumerable<string> Ingredients { get; set; }

    [Required] public IEnumerable<string> Instructions { get; set; }

    public string? Raw { get; set; }
}