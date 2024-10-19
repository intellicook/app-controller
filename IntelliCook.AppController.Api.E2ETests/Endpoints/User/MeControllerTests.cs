using FluentAssertions;
using IntelliCook.AppController.Api.E2ETests.Fixtures;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using Microsoft.AspNetCore.TestHost;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using System.Net;
using System.Net.Http.Json;
using System.Text.Json;

namespace IntelliCook.AppController.Api.E2ETests.Endpoints.User;

[Collection(nameof(ClientFixture))]
public class MeControllerTests
{
    private const string Path = "/User/Me";
    private readonly HttpClient _client;
    private readonly ClientFixture _fixture;
    private readonly Mock<IAuthClient> _authClientMock = new();

    public MeControllerTests(ClientFixture fixture)
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

    #region Get

    [Fact]
    public async void Get_WhenResultIsSuccessful_ReturnsSuccess()
    {
        // Arrange
        var responseModel = new UserGetResponseModel
        {
            Name = "Name",
            Role = UserRoleModel.User,
            Username = "Username",
            Email = "Email@Email.com"
        };
        var result = IAuthClient.Result<UserGetResponseModel>.FromValue(
            HttpStatusCode.OK, responseModel
        );

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(result);

        // Act
        var response = await _client.GetAsync(Path);

        // Assert
        response.StatusCode.Should().Be(result.StatusCode);
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var error = JsonSerializer.Deserialize<UserGetResponseModel>(content, _fixture.SerializerOptions);
        error.Should().BeEquivalentTo(result.Value);

        _authClientMock.Verify(x => x.GetUserMeAsync(), Times.Once);
    }

    [Fact]
    public async void Get_WhenResultIsError_ReturnsError()
    {
        // Arrange
        var result = IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.BadRequest);

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(result);

        // Act
        var response = await _client.GetAsync(Path);

        // Assert
        response.StatusCode.Should().Be(result.StatusCode);

        _authClientMock.Verify(x => x.GetUserMeAsync(), Times.Once);
    }

    #endregion

    #region Put

    [Fact]
    public async void Put_WhenResultIsSuccessful_ReturnsSuccess()
    {
        // Arrange
        var request = new UserPutRequestModel
        {
            Name = "Name",
            Username = "Username",
            Email = "Email@Email.com"
        };
        var responseModel = new UserPutResponseModel
        {
            AccessToken = "Token"
        };
        var result = IAuthClient.Result<UserPutResponseModel>.FromValue(
            HttpStatusCode.OK, responseModel
        );

        _authClientMock
            .Setup(x => x.PutUserMeAsync(It.Is<UserPutRequestModel>(r =>
                r.Name == request.Name &&
                r.Username == request.Username &&
                r.Email == request.Email
            )))
            .ReturnsAsync(result);

        // Act
        var response = await _client.PutAsync(Path, JsonContent.Create(request, options: _fixture.SerializerOptions));

        // Assert
        response.StatusCode.Should().Be(result.StatusCode);
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var error = JsonSerializer.Deserialize<UserPutResponseModel>(content, _fixture.SerializerOptions);
        error.Should().BeEquivalentTo(result.Value);

        _authClientMock.Verify(x => x.PutUserMeAsync(It.Is<UserPutRequestModel>(r =>
            r.Name == request.Name &&
            r.Username == request.Username &&
            r.Email == request.Email
        )), Times.Once);
    }

    [Fact]
    public async void Put_WhenResultIsError_ReturnsError()
    {
        // Arrange
        var request = new UserPutRequestModel
        {
            Name = "Name",
            Username = "Username",
            Email = "Email@Email.com"
        };
        const HttpStatusCode status = HttpStatusCode.BadRequest;
        var result = IAuthClient.Result<UserPutResponseModel>.FromError(
            status,
            new IntelliCook.Auth.Contract.ValidationProblemDetails
            {
                Status = (int)status,
                Detail = "Error"
            }
        );

        _authClientMock
            .Setup(x => x.PutUserMeAsync(It.Is<UserPutRequestModel>(r =>
                r.Name == request.Name &&
                r.Username == request.Username &&
                r.Email == request.Email
            )))
            .ReturnsAsync(result);

        // Act
        var response = await _client.PutAsync(Path, JsonContent.Create(request, options: _fixture.SerializerOptions));

        // Assert
        response.StatusCode.Should().Be(result.StatusCode);

        _authClientMock.Verify(x => x.PutUserMeAsync(It.Is<UserPutRequestModel>(r =>
            r.Name == request.Name &&
            r.Username == request.Username &&
            r.Email == request.Email
        )), Times.Once);
    }

    #endregion

    #region PutPassword

    [Fact]
    public async void PutPassword_WhenResultIsSuccessful_ReturnsSuccess()
    {
        // Arrange
        var request = new UserPasswordPutRequestModel
        {
            OldPassword = "Old Password 1234",
            NewPassword = "New Password 1234"
        };
        var result = IAuthClient.Result.FromValue(HttpStatusCode.NoContent);

        _authClientMock
            .Setup(x => x.PutUserMePasswordAsync(It.Is<UserPasswordPutRequestModel>(r =>
                r.OldPassword == request.OldPassword &&
                r.NewPassword == request.NewPassword
            )))
            .ReturnsAsync(result);

        // Act
        var response = await _client.PutAsync(
            $"{Path}/Password",
            JsonContent.Create(request, options: _fixture.SerializerOptions)
        );

        // Assert
        response.StatusCode.Should().Be(result.StatusCode);

        _authClientMock.Verify(x => x.PutUserMePasswordAsync(It.Is<UserPasswordPutRequestModel>(r =>
            r.OldPassword == request.OldPassword &&
            r.NewPassword == request.NewPassword
        )), Times.Once);
    }

    [Fact]
    public async void PutPassword_WhenResultIsError_ReturnsError()
    {
        // Arrange
        var request = new UserPasswordPutRequestModel
        {
            OldPassword = "Old Password 1234",
            NewPassword = "New Password 1234"
        };
        const HttpStatusCode status = HttpStatusCode.BadRequest;
        var result = IAuthClient.Result.FromError(status, new IntelliCook.Auth.Contract.ValidationProblemDetails
        {
            Status = (int)status,
            Detail = "Error"
        });

        _authClientMock
            .Setup(x => x.PutUserMePasswordAsync(It.Is<UserPasswordPutRequestModel>(r =>
                r.OldPassword == request.OldPassword &&
                r.NewPassword == request.NewPassword
            )))
            .ReturnsAsync(result);

        // Act
        var response = await _client.PutAsync(
            $"{Path}/Password",
            JsonContent.Create(request, options: _fixture.SerializerOptions)
        );

        // Assert
        response.StatusCode.Should().Be(result.StatusCode);

        _authClientMock.Verify(x => x.PutUserMePasswordAsync(It.Is<UserPasswordPutRequestModel>(r =>
            r.OldPassword == request.OldPassword &&
            r.NewPassword == request.NewPassword
        )), Times.Once);
    }

    #endregion

    #region Delete

    [Fact]
    public async void Delete_WhenResultIsSuccessful_ReturnsSuccess()
    {
        // Arrange
        var result = IAuthClient.Result.FromValue(HttpStatusCode.NoContent);

        _authClientMock
            .Setup(x => x.DeleteUserMeAsync())
            .ReturnsAsync(result);

        // Act
        var response = await _client.DeleteAsync(Path);

        // Assert
        response.StatusCode.Should().Be(result.StatusCode);

        _authClientMock.Verify(x => x.DeleteUserMeAsync(), Times.Once);
    }

    [Fact]
    public async void Delete_WhenResultIsError_ReturnsError()
    {
        // Arrange
        const HttpStatusCode status = HttpStatusCode.BadRequest;
        var result = IAuthClient.Result.FromError(status, new IntelliCook.Auth.Contract.ValidationProblemDetails
        {
            Status = (int)status,
            Detail = "Error"
        });

        _authClientMock
            .Setup(x => x.DeleteUserMeAsync())
            .ReturnsAsync(result);

        // Act
        var response = await _client.DeleteAsync(Path);

        // Assert
        response.StatusCode.Should().Be(result.StatusCode);

        _authClientMock.Verify(x => x.DeleteUserMeAsync(), Times.Once);
    }

    #endregion
}