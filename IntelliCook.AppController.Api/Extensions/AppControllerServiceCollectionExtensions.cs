using IntelliCook.AppController.Api.Options;
using IntelliCook.AppController.Infrastructure.Contexts;
using Microsoft.EntityFrameworkCore;

namespace IntelliCook.AppController.Api.Extensions;

public static class AppControllerServiceCollectionExtensions
{
    public static IServiceCollection AddAppControllerOptions<TOptions>(
        this IServiceCollection serviceCollection,
        IConfiguration configuration
    ) where
        TOptions : class, IOptionsBase
    {
        return serviceCollection.Configure<TOptions>(configuration.GetSection(TOptions.SectionKey));
    }

    public static IServiceCollection AddAppControllerContext(
        this IServiceCollection serviceCollection,
        DatabaseOptions options
    )
    {
        return serviceCollection.AddDbContext<AppControllerContext>(options.UseInMemory switch
        {
            true => o => o.UseInMemoryDatabase(options.Name),
            _ => o => o.UseSqlServer(options.ConnectionString)
        });
    }

    public static IHealthChecksBuilder AddAppControllerHealthChecks(
        this IHealthChecksBuilder healthChecksBuilder,
        DatabaseOptions options
    )
    {
        return options.UseInMemory switch
        {
            true => healthChecksBuilder
                .AddDbContextCheck<AppControllerContext>(),
            _ => healthChecksBuilder
                .AddSqlServer(options.ConnectionString, name: "SqlServer")
                .AddDbContextCheck<AppControllerContext>()
        };
    }
}