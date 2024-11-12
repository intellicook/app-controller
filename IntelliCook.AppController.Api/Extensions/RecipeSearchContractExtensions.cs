using IntelliCook.AppController.Api.Models.Health;
using IntelliCook.AppController.Api.Models.RecipeSearch.AddRecipes;
using IntelliCook.AppController.Api.Models.RecipeSearch.ChatByRecipe;
using IntelliCook.AppController.Api.Models.RecipeSearch.FaissIndexThread;
using IntelliCook.AppController.Api.Models.RecipeSearch.Recipe;
using IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipes;
using IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipesByIngredients;
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

    #region SearchRecipesByIngredients

    public static SearchRecipesByIngredientsPostResponseModel ToPostResponseModel(
        this SearchRecipesByIngredientsResponse response
    )
    {
        return new SearchRecipesByIngredientsPostResponseModel
        {
            Recipes = response.Recipes.Select(r => r.ToRecipeModel())
        };
    }

    public static SearchRecipesByIngredientsRecipeDetailModel ToRecipeDetailModel(
        this SearchRecipesByIngredientsRecipeDetail recipe
    )
    {
        return new SearchRecipesByIngredientsRecipeDetailModel
        {
            Ingredients = recipe.Ingredients,
            Instructions = recipe.Instructions,
            Raw = recipe.Raw
        };
    }

    public static SearchRecipesByIngredientsRecipeModel ToRecipeModel(
        this SearchRecipesByIngredientsRecipe recipe
    )
    {
        return new SearchRecipesByIngredientsRecipeModel
        {
            Id = recipe.Id,
            Name = recipe.Name,
            Detail = recipe.Detail?.ToRecipeDetailModel()
        };
    }

    #endregion

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
            Instructions = recipe.Instructions,
            Raw = recipe.Raw
        };
    }

    public static SearchRecipesRecipeModel ToRecipeModel(
        this SearchRecipesRecipe recipe
    )
    {
        return new SearchRecipesRecipeModel
        {
            Id = recipe.Id,
            Name = recipe.Name,
            Ingredients = recipe.Ingredients,
            Detail = recipe.Detail?.ToRecipeDetailModel()
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
            Name = response.Name,
            Ingredients = response.Ingredients,
            Instructions = response.Instructions,
            Raw = response.Raw
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
            Name = recipe.Name,
            Ingredients = recipe.Ingredients,
            Instructions = recipe.Instructions,
            Raw = recipe.Raw
        };
    }

    #endregion

    #region FaissIndexThread

    public static FaissIndexThreadStatusModel ToFaissIndexThreadStatusModel(
        this FaissIndexThreadStatus status
    )
    {
        return status switch
        {
            FaissIndexThreadStatus.Uninitialized => FaissIndexThreadStatusModel.Uninitialized,
            FaissIndexThreadStatus.InProgress => FaissIndexThreadStatusModel.InProgress,
            FaissIndexThreadStatus.Failed => FaissIndexThreadStatusModel.Failed,
            FaissIndexThreadStatus.Completed => FaissIndexThreadStatusModel.Completed,
            _ => throw new ArgumentOutOfRangeException()
        };
    }

    public static FaissIndexThreadArgsModel ToArgsModel(
        this FaissIndexThreadArgs args
    )
    {
        return new FaissIndexThreadArgsModel
        {
            Count = args.Count,
            Model = args.Model,
            Path = args.Path
        };
    }

    public static FaissIndexThreadGetResponseModel ToGetResponseModel(
        this FaissIndexThreadResponse response
    )
    {
        return new FaissIndexThreadGetResponseModel
        {
            Status = response.Status.ToFaissIndexThreadStatusModel(),
            Args = response.Args.ToArgsModel()
        };
    }

    #endregion
}