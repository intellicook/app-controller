using IntelliCook.Auth.Client;

namespace IntelliCook.AppController.Api.Options;

public class AuthOptions : IAppControllerOptions, IAuthOptions
{
    public static string SectionKey => "Auth";

    public Uri BaseUrl { get; set; } = null!;
}