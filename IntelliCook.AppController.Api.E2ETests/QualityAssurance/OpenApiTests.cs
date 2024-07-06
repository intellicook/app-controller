using FluentAssertions;
using IntelliCook.AppController.Api.E2ETests.Fixtures;
using IntelliCook.AppController.Api.Options;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Microsoft.OpenApi.Models;
using Microsoft.OpenApi.Readers;

namespace IntelliCook.AppController.Api.E2ETests.QualityAssurance;

[Collection("Client")]
public class OpenApiTests
{
    private readonly ClientFixture _fixture;
    private readonly ApiOptions _apiOptions;

    public OpenApiTests(ClientFixture fixture)
    {
        _fixture = fixture;
        _apiOptions = _fixture.Factory.Services.GetRequiredService<IOptions<ApiOptions>>().Value;
    }

    [Fact]
    public void Endpoints_HaveSummary()
    {
        // Arrange
        var client = _fixture.Client;

        // Act
        var document = GetOpenApiDocument(client);

        // Assert
        document.Should().NotBeNull();

        foreach (var (path, item) in document!.Paths)
        {
            item.Should().NotBeNull();

            foreach (var (method, operation) in item.Operations)
            {
                operation.Should().NotBeNull();
                operation!.Summary.Should().NotBeNullOrEmpty($"summary is required for {method} {path}");
            }
        }
    }

    private OpenApiDocument? GetOpenApiDocument(HttpClient client)
    {
        var url = $"/swagger/{_apiOptions.VersionString}/swagger.json";
        var response = client.GetAsync(url).Result;
        response.EnsureSuccessStatusCode();
        var content = response.Content.ReadAsStringAsync().Result;
        return new OpenApiStringReader().Read(content, out _);
    }
}