using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.Recipe;

public class RecipeGetResponseModel
{
    [Required] public int Id { get; set; }

    [Required] public string Name { get; set; }

    [Required] public IEnumerable<string> Ingredients { get; set; }

    [Required] public IEnumerable<string> Instructions { get; set; }

    [Required] public string Raw { get; set; }
}