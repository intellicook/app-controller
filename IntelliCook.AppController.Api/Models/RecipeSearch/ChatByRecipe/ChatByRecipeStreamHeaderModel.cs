using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.ChatByRecipe;

public class ChatByRecipeStreamHeaderModel : ChatByRecipePostStreamResponseModel
{
    [Required] public ChatByRecipeRoleModel Role { get; set; }
}