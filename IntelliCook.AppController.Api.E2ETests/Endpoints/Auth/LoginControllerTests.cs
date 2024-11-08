using FluentAssertions;
using IntelliCook.AppController.Api.E2ETests.Fixtures;
using IntelliCook.AppController.Api.Models;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.Auth.Login;
using IntelliCook.Auth.Contract.Auth.Register;
using Microsoft.AspNetCore.TestHost;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using System.Net;
using System.Net.Http.Json;
using System.Text.Json;

namespace IntelliCook.AppController.Api.E2ETests.Endpoints.Auth;

[Collection(nameof(ClientFixture))]
public class LoginControllerTests
{
    private const string Path = "/Auth/Login";
    private readonly HttpClient _client;
    private readonly ClientFixture _fixture;
    private readonly Mock<IAuthClient> _authClientMock = new();

    public LoginControllerTests(ClientFixture fixture)
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
        var request = new LoginPostRequestModel
        {
            Username = "Username",
            Password = "Password 1234"
        };
        var responseModel = new LoginPostResponseModel
        {
            AccessToken = "Token"
        };
        var result = IAuthClient.Result<LoginPostResponseModel>.FromValue(
            HttpStatusCode.Created, responseModel
        );

        _authClientMock
            .Setup(x => x.PostAuthLoginAsync(It.Is<LoginPostRequestModel>(r =>
                r.Username == request.Username &&
                r.Password == request.Password
            )))
            .ReturnsAsync(result);

        // Act
        var response = await _client.PostAsync(Path, JsonContent.Create(request, options: _fixture.SerializerOptions));

        // Assert
        response.StatusCode.Should().Be(result.StatusCode);
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var error = JsonSerializer.Deserialize<LoginPostResponseModel>(content, _fixture.SerializerOptions);
        error.Should().BeEquivalentTo(result.Value);

        _authClientMock.Verify(x => x.PostAuthLoginAsync(It.Is<LoginPostRequestModel>(r =>
            r.Username == request.Username &&
            r.Password == request.Password
        )), Times.Once);
    }

    [Fact]
    public async void Post_WhenResultIsError_ReturnsError()
    {
        // Arrange
        var request = new LoginPostRequestModel
        {
            Username = "Username",
            Password = "Password 1234"
        };
        const HttpStatusCode status = HttpStatusCode.BadRequest;
        var result = IAuthClient.Result<LoginPostResponseModel>.FromError(
            status,
            new IntelliCook.Auth.Contract.ValidationProblemDetails
            {
                Status = (int)status,
                Detail = "Error"
            }
        );

        _authClientMock
            .Setup(x => x.PostAuthLoginAsync(It.Is<LoginPostRequestModel>(r =>
                r.Username == request.Username &&
                r.Password == request.Password
            )))
            .ReturnsAsync(result);

        // Act
        var response = await _client.PostAsync(Path, JsonContent.Create(request, options: _fixture.SerializerOptions));

        // Assert
        response.StatusCode.Should().Be(result.StatusCode);
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var error = JsonSerializer.Deserialize<ValidationProblemDetailsModel>(content, _fixture.SerializerOptions);
        error.Should().BeEquivalentTo(result.Error);

        _authClientMock.Verify(x => x.PostAuthLoginAsync(It.Is<LoginPostRequestModel>(r =>
            r.Username == request.Username &&
            r.Password == request.Password
        )), Times.Once);
    }

    #endregion
}