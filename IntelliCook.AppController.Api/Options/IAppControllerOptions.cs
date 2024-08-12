namespace IntelliCook.AppController.Api.Options;

public interface IAppControllerOptions
{
    public static abstract string SectionKey { get; }

    public void Validate()
    {
    }
}