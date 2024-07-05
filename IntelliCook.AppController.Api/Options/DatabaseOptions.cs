namespace IntelliCook.AppController.Api.Options;

public class DatabaseOptions : IOptionsBase
{
    public static string SectionKey => "Database";

    public required string Name { get; init; }
    public string ConnectionString { get; init; } = string.Empty;
    public bool UseInMemory { get; init; }
}