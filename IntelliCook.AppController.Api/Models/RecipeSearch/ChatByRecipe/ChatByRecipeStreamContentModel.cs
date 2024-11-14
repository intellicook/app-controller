using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.ChatByRecipe;

public class ChatByRecipeStreamContentModel : ChatByRecipePostStreamResponseModel
{
    [Required] public string Text { get; set; }
}