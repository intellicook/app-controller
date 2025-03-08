using IntelliCook.AppController.Api.Models.RecipeSearch.ChatByRecipe;
using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipes;

public class SearchRecipesPostRequestModel : ChatByRecipeFunctionCallModel
{
    [Required]
    [MinLength(1, ErrorMessage = "Ingredients cannot be empty.")]
    public IEnumerable<string> Ingredients { get; set; }

    public string? ExtraTerms { get; set; }

    [Range(1, uint.MaxValue, ErrorMessage = "Page must be a positive integer.")]
    public uint? Page { get; set; }

    [Range(1, uint.MaxValue, ErrorMessage = "Per page must be a positive integer.")]
    public uint? PerPage { get; set; }

    public bool? IncludeDetail { get; set; }
}