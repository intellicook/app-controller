using Microsoft.AspNetCore.Mvc.Testing;

namespace IntelliCook.AppController.Api.E2ETests;

public class E2ETestBase(WebApplicationFactory<Program> factory) : IClassFixture<WebApplicationFactory<Program>>
{
    protected readonly HttpClient Client = factory.CreateClient();
}