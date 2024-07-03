using AppController.Contexts;
using Microsoft.EntityFrameworkCore;

namespace AppController.Extensions;

public static class ServiceCollectionExtensions
{
    private const string UseInMemoryDatabaseEnvironmentVariable = "USE_IN_MEMORY_DATABASE";
    private const string DatabaseName = nameof(AppControllerContext);
    private const string ConnectionStringName = nameof(AppControllerContext);

    private static bool UseInMemoryDatabase =>
        Environment.GetEnvironmentVariable(UseInMemoryDatabaseEnvironmentVariable)?.ToLower().Trim() == "true";

    private static string GetConnectionString(IConfigurationManager configurationManager) =>
        configurationManager.GetConnectionString(ConnectionStringName) ??
        throw new InvalidOperationException($"{ConnectionStringName} connection string is required");

    public static IServiceCollection AddAppControllerContext(
        this IServiceCollection serviceCollection,
        IConfigurationManager configurationManager
    ) => serviceCollection.AddDbContext<AppControllerContext>(
        UseInMemoryDatabase
            ? o => o.UseInMemoryDatabase(DatabaseName)
            : o => o.UseSqlServer(GetConnectionString(configurationManager))
    );

    public static IHealthChecksBuilder AddAppControllerContextHealthChecks(
        this IServiceCollection serviceCollection,
        IConfigurationManager configurationManager
    ) => UseInMemoryDatabase
        ? serviceCollection.AddHealthChecks().AddDbContextCheck<AppControllerContext>(name: "InMemoryDatabase")
        : serviceCollection.AddHealthChecks()
            .AddSqlServer(GetConnectionString(configurationManager), name: "SqlServer")
            .AddDbContextCheck<AppControllerContext>(name: DatabaseName);
}
