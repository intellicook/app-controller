using IntelliCook.AppController.Api.Options;
using IntelliCook.Auth.Client;
using Microsoft.AspNetCore.Mvc.Testing;
using Microsoft.AspNetCore.TestHost;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace IntelliCook.AppController.Api.E2ETests.Fixtures;

public class ClientFixture : IDisposable
{
    public ClientFixture()
    {
        Environment.SetEnvironmentVariable(
            $"{DatabaseOptions.SectionKey}:{nameof(DatabaseOptions.UseInMemory)}",
            "true"
        );

        Factory = new WebApplicationFactory<Program>();
        Client = Factory.WithWebHostBuilder(builder =>
        {
            builder.ConfigureTestServices(ConfigureDefaultTestServices);
        }).CreateClient();
    }

    public Mock<IAuthClient> AuthClientMock { get; } = new();

    public WebApplicationFactory<Program> Factory { get; }
    public HttpClient Client { get; }

    public JsonSerializerOptions SerializerOptions { get; } = new()
    {
        PropertyNameCaseInsensitive = true,
        Converters = { new JsonStringEnumConverter() },
        UnmappedMemberHandling = JsonUnmappedMemberHandling.Disallow
    };

    public void Dispose()
    {
        GC.SuppressFinalize(this);
        Client.Dispose();
        Factory.Dispose();
    }

    public void ConfigureDefaultTestServices(IServiceCollection services)
    {
        services.AddScoped<IAuthClient>(_ => AuthClientMock.Object);
    }
}

[CollectionDefinition(nameof(ClientFixture))]
public class ClientCollection : ICollectionFixture<ClientFixture>;