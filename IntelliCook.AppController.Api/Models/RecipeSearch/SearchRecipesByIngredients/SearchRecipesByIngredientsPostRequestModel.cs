using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipesByIngredients;

public class SearchRecipesByIngredientsPostRequestModel
{
    [Required]
    [MinLength(1, ErrorMessage = "Ingredients cannot be empty")]
    public IEnumerable<string> Ingredients { get; set; }

    [Range(1, uint.MaxValue, ErrorMessage = "Limit must be a positive integer.")]
    public uint? Limit { get; set; }

    public bool? IncludeDetail { get; set; }
}