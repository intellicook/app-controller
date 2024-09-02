using FluentAssertions;
using IntelliCook.AppController.Api.E2ETests.Fixtures;
using IntelliCook.AppController.Api.Models;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.Auth.Register;
using Microsoft.AspNetCore.TestHost;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using System.Net;
using System.Net.Http.Json;
using System.Text.Json;

namespace IntelliCook.AppController.Api.E2ETests.Endpoints.Auth;

[Collection(nameof(ClientFixture))]
public class RegisterControllerTests
{
    private const string Path = "/Auth/Register";
    private readonly HttpClient _client;
    private readonly ClientFixture _fixture;
    private readonly Mock<IAuthClient> _authClientMock = new();

    public RegisterControllerTests(ClientFixture fixture)
    {
        _fixture = fixture;
        _client = fixture.Factory.WithWebHostBuilder(builder =>
        {
            builder.ConfigureTestServices(services =>
            {
                _fixture.ConfigureDefaultTestServices(services);
                services.AddScoped<IAuthClient>(_ => _authClientMock.Object);
            });
        }).CreateClient();
    }

    #region Post

    [Fact]
    public async void Post_WhenResultIsSuccessful_ReturnsSuccess()
    {
        // Arrange
        var request = new RegisterPostRequestModel
        {
            Name = "Name",
            Username = "Username",
            Email = "Email@Email.com",
            Password = "Password 1234"
        };
        var result = IAuthClient.Result.FromValue(HttpStatusCode.Created);

        _authClientMock
            .Setup(x => x.PostAuthRegisterAsync(It.Is<RegisterPostRequestModel>(r =>
                r.Name == request.Name &&
                r.Username == request.Username &&
                r.Email == request.Email &&
                r.Password == request.Password
            )))
            .ReturnsAsync(result);

        // Act
        var response = await _client.PostAsync(Path, JsonContent.Create(request, options: _fixture.SerializerOptions));

        // Assert
        response.StatusCode.Should().Be(result.StatusCode);
    }

    [Fact]
    public async void Post_WhenResultIsError_ReturnsError()
    {
        // Arrange
        var request = new RegisterPostRequestModel
        {
            Name = "Name",
            Username = "Username",
            Email = "Email@Email.com",
            Password = "Password 1234"
        };
        const HttpStatusCode status = HttpStatusCode.BadRequest;
        var result = IAuthClient.Result.FromError(status, new IntelliCook.Auth.Contract.ValidationProblemDetails
        {
            Status = (int)status,
            Detail = "Error"
        });

        _authClientMock
            .Setup(x => x.PostAuthRegisterAsync(It.Is<RegisterPostRequestModel>(r =>
                r.Name == request.Name &&
                r.Username == request.Username &&
                r.Email == request.Email &&
                r.Password == request.Password
            )))
            .ReturnsAsync(result);

        // Act
        var response = await _client.PostAsync(Path, JsonContent.Create(request, options: _fixture.SerializerOptions));

        // Assert
        response.StatusCode.Should().Be(result.StatusCode);
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var error = JsonSerializer.Deserialize<ValidationProblemDetails>(content, _fixture.SerializerOptions);
        error.Should().BeEquivalentTo(result.Error);
    }

    #endregion
}