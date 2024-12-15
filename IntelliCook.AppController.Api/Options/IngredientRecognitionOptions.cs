namespace IntelliCook.AppController.Api.Options;

public class IngredientRecognitionOptions : IAppControllerOptions
{
    public static string SectionKey => "IngredientRecognition";

    public Uri BaseUrl { get; set; } = null!;
}