using IntelliCook.AppController.Api.Models.Health;
using IntelliCook.AppController.Api.Models.RecipeSearch.AddRecipes;
using IntelliCook.AppController.Api.Models.RecipeSearch.ChatByRecipe;
using IntelliCook.AppController.Api.Models.RecipeSearch.Recipe;
using IntelliCook.AppController.Api.Models.RecipeSearch.RecipeNutrition;
using IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipes;
using IntelliCook.AppController.Api.Models.RecipeSearch.SetUserProfile;
using IntelliCook.AppController.Api.Models.RecipeSearch.UserProfile;
using IntelliCook.RecipeSearch.Client;

namespace IntelliCook.AppController.Api.Extensions;

public static class RecipeSearchContractExtensions
{
    #region Health

    public static HealthStatusModel ToHealthStatusModel(this HealthStatus model)
    {
        return model switch
        {
            HealthStatus.Healthy => HealthStatusModel.Healthy,
            HealthStatus.Degraded => HealthStatusModel.Degraded,
            HealthStatus.Unhealthy => HealthStatusModel.Unhealthy,
            _ => throw new ArgumentOutOfRangeException(nameof(model), model, null)
        };
    }

    public static HealthCheckModel ToHealthCheckModel(this HealthCheck model)
    {
        return new HealthCheckModel
        {
            Name = model.Name,
            Status = model.Status.ToHealthStatusModel()
        };
    }

    public static HealthGetResponseModel ToHealthGetResponseModel(
        this HealthResponse model)
    {
        return new HealthGetResponseModel
        {
            Service = HealthServiceModel.RecipeSearch,
            Status = model.Status.ToHealthStatusModel(),
            Checks = model.Checks.Select(ToHealthCheckModel)
        };
    }

    #endregion

    #region RecipeNutrion

    public static RecipeNutritionModel ToRecipeNutritionModel(
        this RecipeNutrition nutrition
    )
    {
        return new RecipeNutritionModel
        {
            Calories = nutrition.Calories.ToRecipeNutritionValueModel(),
            Fat = nutrition.Fat.ToRecipeNutritionValueModel(),
            Protein = nutrition.Protein.ToRecipeNutritionValueModel(),
            Carbs = nutrition.Carbs.ToRecipeNutritionValueModel()
        };
    }

    public static RecipeNutritionValueModel ToRecipeNutritionValueModel(
        this RecipeNutritionValue value
    )
    {
        return value switch
        {
            RecipeNutritionValue.High => RecipeNutritionValueModel.High,
            RecipeNutritionValue.Medium => RecipeNutritionValueModel.Medium,
            RecipeNutritionValue.Low => RecipeNutritionValueModel.Low,
            RecipeNutritionValue.None => RecipeNutritionValueModel.None,
            _ => throw new ArgumentOutOfRangeException()
        };
    }

    #endregion RecipeNutrion

    #region SearchRecipes

    public static SearchRecipesPostResponseModel ToPostResponseModel(
        this SearchRecipesResponse response
    )
    {
        return new SearchRecipesPostResponseModel
        {
            Recipes = response.Recipes.Select(r => r.ToRecipeModel())
        };
    }

    public static SearchRecipesRecipeDetailModel ToRecipeDetailModel(
        this SearchRecipesRecipeDetail recipe
    )
    {
        return new SearchRecipesRecipeDetailModel
        {
            Directions = recipe.Directions,
            Tips = recipe.Tips,
            Utensils = recipe.Utensils,
            Nutrition = recipe.Nutrition.ToRecipeNutritionModel()
        };
    }

    public static SearchRecipesRecipeModel ToRecipeModel(
        this SearchRecipesRecipe recipe
    )
    {
        return new SearchRecipesRecipeModel
        {
            Id = recipe.Id,
            Title = recipe.Title,
            Description = recipe.Description,
            Ingredients = recipe.Ingredients.Select(i => i.ToRecipeIngredientModel()),
            Matches = recipe.Matches.Select(m => m.ToMatchModel()),
            Detail = recipe.Detail?.ToRecipeDetailModel()
        };
    }

    public static SearchRecipesRecipeIngredientModel ToRecipeIngredientModel(
        this SearchRecipesRecipeIngredient ingredient
    )
    {
        return new SearchRecipesRecipeIngredientModel
        {
            Name = ingredient.Name,
            Quantity = ingredient.Quantity,
            Unit = ingredient.Unit
        };
    }

    public static SearchRecipesMatchModel ToMatchModel(
        this SearchRecipesMatch match
    )
    {
        return new SearchRecipesMatchModel
        {
            Field = match.Field.ToFieldModel(),
            Tokens = match.Tokens,
            Index = match.Field switch
            {
                SearchRecipesMatchField.Title => null,
                SearchRecipesMatchField.Description => null,
                SearchRecipesMatchField.Ingredients => match.Index,
                _ => throw new ArgumentOutOfRangeException()
            }
        };
    }

    public static SearchRecipesMatchFieldModel ToFieldModel(
        this SearchRecipesMatchField field
    )
    {
        return field switch
        {
            SearchRecipesMatchField.Title => SearchRecipesMatchFieldModel.Title,
            SearchRecipesMatchField.Description => SearchRecipesMatchFieldModel.Description,
            SearchRecipesMatchField.Ingredients => SearchRecipesMatchFieldModel.Ingredients,
            _ => throw new ArgumentOutOfRangeException()
        };
    }

    #endregion

    #region Recipe

    public static RecipeGetResponseModel ToGetResponseModel(
        this RecipeResponse response
    )
    {
        return new RecipeGetResponseModel
        {
            Id = response.Id,
            Title = response.Title,
            Description = response.Description,
            Ingredients = response.Ingredients.Select(i => i.ToRecipeIngredientModel()),
            Directions = response.Directions,
            Tips = response.Tips,
            Utensils = response.Utensils,
            Nutrition = response.Nutrition.ToRecipeNutritionModel()
        };
    }

    public static RecipeRecipeIngredientModel ToRecipeIngredientModel(
        this RecipeRecipeIngredient ingredient
    )
    {
        return new RecipeRecipeIngredientModel
        {
            Name = ingredient.Name,
            Quantity = ingredient.Quantity,
            Unit = ingredient.Unit
        };
    }

    #endregion

    #region ChatByRecipe

    public static ChatByRecipePostResponseModel ToPostResponseModel(
        this ChatByRecipeResponse response
    )
    {
        return new ChatByRecipePostResponseModel
        {
            Message = response.Message.ToMessageModel(),
            FunctionCall = response.FunctionCall?.ToFunctionCallModel()
        };
    }

    public static ChatByRecipeMessageModel ToMessageModel(
        this ChatByRecipeMessage message
    )
    {
        return new ChatByRecipeMessageModel
        {
            Role = message.Role.ToRoleModel(),
            Text = message.Text
        };
    }

    public static ChatByRecipeRoleModel ToRoleModel(
        this ChatByRecipeRole role
    )
    {
        return role switch
        {
            ChatByRecipeRole.User => ChatByRecipeRoleModel.User,
            ChatByRecipeRole.Assistant => ChatByRecipeRoleModel.Assistant,
            _ => throw new ArgumentOutOfRangeException()
        };
    }

    public static ChatByRecipeStreamHeaderModel ToStreamHeaderModel(
        this ChatByRecipeStreamHeader header
    )
    {
        return new ChatByRecipeStreamHeaderModel
        {
            Role = header.Role.ToRoleModel()
        };
    }

    public static ChatByRecipeStreamContentModel ToStreamContentModel(
        this ChatByRecipeStreamContent content
    )
    {
        return new ChatByRecipeStreamContentModel
        {
            Text = content.Text
        };
    }

    public static ChatByRecipePostStreamResponseModel ToPostStreamResponseModel(
        this ChatByRecipeStreamResponse response
    )
    {
        return response.ResponseCase switch
        {
            ChatByRecipeStreamResponse.ResponseOneofCase.Header => response.Header.ToStreamHeaderModel(),
            ChatByRecipeStreamResponse.ResponseOneofCase.Content => response.Content.ToStreamContentModel(),
            _ => throw new ArgumentOutOfRangeException()
        };
    }

    public static ChatByRecipeFunctionCallModel ToFunctionCallModel(
        this ChatByRecipeFunctionCall call
    )
    {
        return call.FunctionCallCase switch
        {
            ChatByRecipeFunctionCall.FunctionCallOneofCase.SetUserProfile => new SetUserProfilePostRequestModel()
            {
                VeggieIdentity = call.SetUserProfile.VeggieIdentity.ToUserProfileVeggieIdentityModel(),
                Prefer = call.SetUserProfile.Prefer,
                Dislike = call.SetUserProfile.Dislike
            },
            ChatByRecipeFunctionCall.FunctionCallOneofCase.SearchRecipes => new SearchRecipesPostRequestModel()
            {
                Ingredients = call.SearchRecipes.Ingredients,
                ExtraTerms = call.SearchRecipes.ExtraTerms,
            },
            _ => throw new ArgumentOutOfRangeException()
        };
    }

    #endregion

    #region AddRecipes

    public static AddRecipesPostResponseModel ToPostResponseModel(
        this AddRecipesResponse response
    )
    {
        return new AddRecipesPostResponseModel
        {
            Recipes = response.Recipes.Select(r => r.ToRecipeModel())
        };
    }

    public static AddRecipesResponseRecipeModel ToRecipeModel(
        this AddRecipesResponseRecipe recipe
    )
    {
        return new AddRecipesResponseRecipeModel
        {
            Id = recipe.Id,
            Title = recipe.Title,
            Description = recipe.Description,
            Ingredients = recipe.Ingredients.Select(i => i.ToRecipeIngredientModel()),
            Directions = recipe.Directions,
            Tips = recipe.Tips,
            Utensils = recipe.Utensils,
            Nutrition = recipe.Nutrition.ToRecipeNutritionModel()
        };
    }

    public static AddRecipesRecipeIngredientModel ToRecipeIngredientModel(
        this AddRecipesRecipeIngredient ingredient
    )
    {
        return new AddRecipesRecipeIngredientModel
        {
            Name = ingredient.Name,
            Quantity = ingredient.Quantity,
            Unit = ingredient.Unit
        };
    }

    #endregion

    #region SetUserProfile

    public static SetUserProfilePostResponseModel ToPostResponseModel(
        this SetUserProfileResponse response
    )
    {
        return new SetUserProfilePostResponseModel
        {
            VeggieIdentity = response.VeggieIdentity.ToUserProfileVeggieIdentityModel(),
            Prefer = response.Prefer,
            Dislike = response.Dislike
        };
    }

    #endregion

    #region UserProfile

    public static UserProfileGetResponseModel ToGetResponseModel(
        this UserProfileResponse response
    )
    {
        return new UserProfileGetResponseModel
        {
            VeggieIdentity = response.VeggieIdentity.ToUserProfileVeggieIdentityModel(),
            Prefer = response.Prefer,
            Dislike = response.Dislike
        };
    }

    public static UserProfileVeggieIdentityModel ToUserProfileVeggieIdentityModel(
        this UserProfileVeggieIdentity identity
    )
    {
        return identity switch
        {
            UserProfileVeggieIdentity.None => UserProfileVeggieIdentityModel.None,
            UserProfileVeggieIdentity.Vegetarian => UserProfileVeggieIdentityModel.Vegetarian,
            UserProfileVeggieIdentity.Vegan => UserProfileVeggieIdentityModel.Vegan,
            _ => throw new ArgumentOutOfRangeException()
        };
    }

    #endregion
}