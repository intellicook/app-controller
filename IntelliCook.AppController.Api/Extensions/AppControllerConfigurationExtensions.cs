using IntelliCook.AppController.Api.Options;

namespace IntelliCook.AppController.Api.Extensions;

public static class AppControllerConfigurationExtensions
{
    public static IConfigurationSection GetValidatedSection<TOptions>(this IConfiguration configuration)
        where TOptions : IAppControllerOptions
    {
        var section = configuration.GetSection(TOptions.SectionKey);

        // Checks for existence
        if (!section.Exists())
        {
            throw new InvalidOperationException(
                $"{typeof(TOptions).Name} options section '{TOptions.SectionKey}' not found");
        }

        // Validation
        var options = section.Get<TOptions>();
        if (options is null)
        {
            throw new InvalidOperationException(
                $"Failed to bind {typeof(TOptions).Name} options section '{TOptions.SectionKey}'");
        }

        options.Validate();

        return section;
    }

    public static TOptions GetAppControllerOptions<TOptions>(this IConfiguration configuration)
        where TOptions : IAppControllerOptions
    {
        return configuration.GetValidatedSection<TOptions>().Get<TOptions>()!;
    }
}