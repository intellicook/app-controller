using IntelliCook.AppController.Api.Options;

namespace IntelliCook.AppController.Api.Extensions;

public static class AppControllerConfigurationExtensions
{
    public static TOptions? TryGetAppControllerOptions<TOptions>(this IConfiguration configuration)
        where TOptions : IOptionsBase
    {
        return configuration.GetSection(TOptions.SectionKey).Get<TOptions>();
    }

    public static TOptions GetAppControllerOptions<TOptions>(this IConfiguration configuration)
        where TOptions : IOptionsBase
    {
        return configuration.TryGetAppControllerOptions<TOptions>() ??
               throw new InvalidOperationException(
                   $"{nameof(TOptions)} options section {TOptions.SectionKey} not found.");
    }
}