using IntelliCook.AppController.Api.Options;
using IntelliCook.IngredientRecognition.Client;
using IntelliCook.RecipeSearch.Client;

namespace IntelliCook.AppController.Api.Extensions;

public static class AppControllerServiceCollectionExtensions
{
    public static IServiceCollection AddAppControllerOptions<TOptions>(
        this IServiceCollection services,
        IConfiguration configuration
    ) where
        TOptions : class, IAppControllerOptions
    {
        return services.Configure<TOptions>(configuration.GetValidatedSection<TOptions>());
    }

    public static IServiceCollection AddRecipeSearchClient(
        this IServiceCollection services,
        RecipeSearchOptions options
    )
    {
        services.AddOptions<RecipeSearchOptions>().Configure(o => o.BaseUrl = options.BaseUrl);
        services.AddGrpcClient<RecipeSearchService.RecipeSearchServiceClient>(o => o.Address = options.BaseUrl);
        return services;
    }

    public static IServiceCollection AddIngredientRecognitionClient(
        this IServiceCollection services,
        IngredientRecognitionOptions options
    )
    {
        services.AddOptions<IngredientRecognitionOptions>().Configure(o => o.BaseUrl = options.BaseUrl);
        services.AddGrpcClient<IngredientRecognitionService.IngredientRecognitionServiceClient>(o =>
            o.Address = options.BaseUrl);
        return services;
    }
}