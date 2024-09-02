using FluentAssertions;
using IntelliCook.AppController.Api.Controllers.Auth;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.Auth.Login;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System.Net;
using ValidationProblemDetails = IntelliCook.Auth.Contract.ValidationProblemDetails;

namespace IntelliCook.AppController.Api.UnitTests.Controllers.Auth;

public class LoginControllerTests
{
    private readonly LoginController _loginController;
    private readonly Mock<IAuthClient> _authClientMock = new();

    public LoginControllerTests()
    {
        _loginController = new LoginController(_authClientMock.Object);
    }

    #region Post

    [Fact]
    public async void Post_WhenResultIsSuccessful_ReturnsSuccess()
    {
        // Arrange
        var request = new LoginPostRequestModel
        {
            Username = "Username",
            Password = "Password"
        };
        var responseModel = new LoginPostResponseModel
        {
            AccessToken = "Token"
        };
        var result = IAuthClient.Result<LoginPostResponseModel>.FromValue(
            HttpStatusCode.Created, responseModel
        );

        _authClientMock
            .Setup(x => x.PostAuthLoginAsync(request))
            .ReturnsAsync(result);

        // Act
        var response = await _loginController.Post(request);

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(responseModel)
        {
            StatusCode = (int)result.StatusCode
        });
    }

    [Fact]
    public async void Post_WhenResultHasError_ReturnsError()
    {
        // Arrange
        const HttpStatusCode status = HttpStatusCode.BadRequest;
        var request = new LoginPostRequestModel
        {
            Username = "Username",
            Password = "Password"
        };
        var result = IAuthClient.Result<LoginPostResponseModel>.FromError(status, new ValidationProblemDetails
        {
            Status = (int)status,
            Detail = "Error"
        });

        _authClientMock
            .Setup(x => x.PostAuthLoginAsync(request))
            .ReturnsAsync(result);

        // Act
        var response = await _loginController.Post(request);

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(result.Error)
        {
            StatusCode = (int)result.StatusCode
        });
    }

    #endregion
}