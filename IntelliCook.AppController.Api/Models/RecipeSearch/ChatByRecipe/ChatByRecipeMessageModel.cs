using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.ChatByRecipe;

public class ChatByRecipeMessageModel
{
    [Required] public ChatByRecipeRoleModel Role { get; set; }

    [Required] public string Text { get; set; }
}