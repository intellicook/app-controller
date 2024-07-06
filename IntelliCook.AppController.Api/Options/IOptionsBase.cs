namespace IntelliCook.AppController.Api.Options;

public interface IOptionsBase
{
    public static abstract string SectionKey { get; }

    public void Validate()
    {
    }
}