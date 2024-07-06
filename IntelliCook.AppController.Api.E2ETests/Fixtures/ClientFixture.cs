using IntelliCook.AppController.Api.Options;
using Microsoft.AspNetCore.Mvc.Testing;

namespace IntelliCook.AppController.Api.E2ETests.Fixtures;

public class ClientFixture : IDisposable
{
    public WebApplicationFactory<Program> Factory { get; }
    public HttpClient Client { get; init; }

    public ClientFixture()
    {
        Environment.SetEnvironmentVariable(
            $"{DatabaseOptions.SectionKey}:{nameof(DatabaseOptions.UseInMemory)}",
            "true"
        );

        Factory = new WebApplicationFactory<Program>();
        Client = Factory.CreateClient();
    }

    public void Dispose()
    {
        Client.Dispose();
        Factory.Dispose();
    }
}

[CollectionDefinition("Client")]
public class ClientCollection : ICollectionFixture<ClientFixture>
{
}