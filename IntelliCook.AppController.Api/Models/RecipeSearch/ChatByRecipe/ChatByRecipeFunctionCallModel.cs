using IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipes;
using IntelliCook.AppController.Api.Models.RecipeSearch.SetUserProfile;
using System.Text.Json.Serialization;

namespace IntelliCook.AppController.Api.Models.RecipeSearch.ChatByRecipe;

[JsonPolymorphic]
[JsonDerivedType(typeof(SetUserProfilePostRequestModel), typeDiscriminator: "set_user_profile")]
[JsonDerivedType(typeof(SearchRecipesPostRequestModel), typeDiscriminator: "search_recipes")]
public abstract class ChatByRecipeFunctionCallModel
{
}