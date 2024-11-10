namespace IntelliCook.AppController.Api.Models.RecipeSearch.InitFaissIndex;

public class InitFaissIndexPostRequestModel
{
    /// <summary>
    ///     Number of recipes in the database to index.
    /// </summary>
    public uint? Count { get; set; }

    /// <summary>
    ///     Path to the index file. It is suggested to leave this empty because it is a file path on the server and depends on the server configuration.
    /// </summary>
    public string? Path { get; set; }
}