namespace IntelliCook.AppController.Api.Options;

public class RecipeSearchOptions : IAppControllerOptions
{
    public static string SectionKey => "RecipeSearch";

    public Uri BaseUrl { get; set; } = null!;
}