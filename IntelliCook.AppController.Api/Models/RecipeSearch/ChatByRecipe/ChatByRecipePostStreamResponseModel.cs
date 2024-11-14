using System.Text.Json.Serialization;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.ChatByRecipe;

[JsonPolymorphic]
[JsonDerivedType(typeof(ChatByRecipeStreamHeaderModel), typeDiscriminator: "header")]
[JsonDerivedType(typeof(ChatByRecipeStreamContentModel), typeDiscriminator: "content")]
public abstract class ChatByRecipePostStreamResponseModel
{
}