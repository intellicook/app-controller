using IntelliCook.AppController.API.Options;
using IntelliCook.AppController.Infrastructure.Contexts;
using Microsoft.EntityFrameworkCore;

namespace IntelliCook.AppController.API.Extensions;

public static class AppControllerServiceCollectionExtensions
{
    public static IServiceCollection AddAppControllerDatabaseOptions(
        this IServiceCollection serviceCollection,
        IConfiguration configuration
    )
    {
        return serviceCollection.Configure<DatabaseOptions>(configuration.GetSection(DatabaseOptions.SectionKey));
    }

    public static IServiceCollection AddAppControllerContext(
        this IServiceCollection serviceCollection,
        IConfiguration configuration
    )
    {
        var databaseOptions = GetDatabaseOptions(configuration);
        return serviceCollection.AddDbContext<AppControllerContext>(databaseOptions.UseInMemory switch
        {
            true => o => o.UseInMemoryDatabase(databaseOptions.Name),
            _ => o => o.UseSqlServer(databaseOptions.ConnectionString)
        });
    }

    public static IHealthChecksBuilder AddAppControllerHealthChecks(
        this IHealthChecksBuilder healthChecksBuilder,
        IConfiguration configuration
    )
    {
        var databaseOptions = GetDatabaseOptions(configuration);
        return databaseOptions.UseInMemory switch
        {
            true => healthChecksBuilder
                .AddDbContextCheck<AppControllerContext>(),
            _ => healthChecksBuilder
                .AddSqlServer(databaseOptions.ConnectionString, name: "SqlServer")
                .AddDbContextCheck<AppControllerContext>()
        };
    }

    private static DatabaseOptions GetDatabaseOptions(IConfiguration configuration)
    {
        return configuration.GetSection(DatabaseOptions.SectionKey).Get<DatabaseOptions>() ?? new DatabaseOptions();
    }
}