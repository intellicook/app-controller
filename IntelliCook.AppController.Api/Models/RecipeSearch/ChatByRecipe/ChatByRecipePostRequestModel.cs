using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.ChatByRecipe;

public class ChatByRecipePostRequestModel
{
    [Required] public int Id { get; set; }

    [Required]
    [MinLength(1, ErrorMessage = "Messages cannot be empty")]
    public IEnumerable<ChatByRecipeMessageModel> Messages { get; set; }
}