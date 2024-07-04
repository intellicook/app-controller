namespace IntelliCook.AppController.API.Options;

public class DatabaseOptions
{
    public const string SectionKey = "Database";

    public string Name { get; init; } = string.Empty;
    public string ConnectionString { get; init; } = string.Empty;
    public bool UseInMemory { get; init; }
}
