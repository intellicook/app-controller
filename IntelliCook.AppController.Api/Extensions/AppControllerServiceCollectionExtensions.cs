using IntelliCook.AppController.Api.Options;
using IntelliCook.AppController.Infrastructure.Contexts;
using IntelliCook.RecipeSearch.Client;
using Microsoft.EntityFrameworkCore;

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

    public static IServiceCollection AddAppControllerContext(
        this IServiceCollection services,
        DatabaseOptions options
    )
    {
        return services.AddDbContext<AppControllerContext>(options.UseInMemory switch
        {
            true => o => o.UseInMemoryDatabase(options.Name),
            _ => o => o.UseSqlServer(options.ConnectionString)
        });
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
}