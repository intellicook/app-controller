using IntelliCook.AppController.Api.Models.Health;
using IntelliCook.AppController.Api.Models.RecipeSearch.ChatByRecipe;
using IntelliCook.AppController.Api.Models.RecipeSearch.Recipe;
using IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipesByIngredients;
using IntelliCook.RecipeSearch.Client;

namespace IntelliCook.AppController.Api.Extensions;

public static class RecipeSearchContractExtensions
{
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

    public static SearchRecipesByIngredientsPostResponseModel ToPostResponseModel(
        this SearchRecipesByIngredientsResponse response
    )
    {
        return new SearchRecipesByIngredientsPostResponseModel
        {
            Recipes = response.Recipes.Select(r => r.ToRecipeModel())
        };
    }

    public static SearchRecipesByIngredientsRecipeModel ToRecipeModel(
        this SearchRecipesByIngredientsRecipe recipe
    )
    {
        return new SearchRecipesByIngredientsRecipeModel
        {
            Id = recipe.Id,
            Distance = recipe.Distance,
            Name = recipe.Name
        };
    }

    public static RecipeGetResponseModel ToGetResponseModel(
        this RecipeResponse response
    )
    {
        return new RecipeGetResponseModel
        {
            Name = response.Name,
            Ingredients = response.Ingredients,
            Instructions = response.Instructions
        };
    }

    public static ChatByRecipePostResponseModel ToPostResponseModel(
        this ChatByRecipeResponse response
    )
    {
        return new ChatByRecipePostResponseModel
        {
            Message = response.Message.ToMessageModel(),
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
            ChatByRecipeRole.System => ChatByRecipeRoleModel.System,
            ChatByRecipeRole.User => ChatByRecipeRoleModel.User,
            ChatByRecipeRole.Assistant => ChatByRecipeRoleModel.Assistant,
            _ => throw new ArgumentOutOfRangeException()
        };
    }
}