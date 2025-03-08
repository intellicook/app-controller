using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.ChatByRecipe;

public class ChatByRecipePostResponseModel
{
    [Required] public ChatByRecipeMessageModel Message { get; set; }
    public ChatByRecipeFunctionCallModel? FunctionCall { get; set; }
}