using IntelliCook.AppController.Api.Options;
using IntelliCook.AppController.Infrastructure.Contexts;

namespace IntelliCook.AppController.Api.Extensions;

public static class AppControllerHealthChecksBuilderExtensions
{
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
                .AddSqlServer(options.ConnectionString!, name: "SqlServer")
                .AddDbContextCheck<AppControllerContext>()
        };
    }
}