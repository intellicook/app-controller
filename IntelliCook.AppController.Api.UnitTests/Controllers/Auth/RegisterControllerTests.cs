using FluentAssertions;
using IntelliCook.AppController.Api.Controllers.Auth;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.Auth.Register;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System.Net;
using ValidationProblemDetails = IntelliCook.Auth.Contract.ValidationProblemDetails;

namespace IntelliCook.AppController.Api.UnitTests.Controllers.Auth;

public class RegisterControllerTests
{
    private readonly RegisterController _registerController;
    private readonly Mock<IAuthClient> _authClientMock = new();

    public RegisterControllerTests()
    {
        _registerController = new RegisterController(_authClientMock.Object);
    }

    #region Post

    [Fact]
    public async void Post_WhenResultIsSuccessful_ReturnsSuccess()
    {
        // Arrange
        var request = new RegisterPostRequestModel();
        var result = IAuthClient.Result.FromValue(HttpStatusCode.Created);

        _authClientMock
            .Setup(x => x.PostAuthRegisterAsync(request))
            .ReturnsAsync(result);

        // Act
        var response = await _registerController.Post(request);

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(null)
        {
            StatusCode = (int)result.StatusCode
        });
    }

    [Fact]
    public async void Post_WhenResultHasError_ReturnsError()
    {
        // Arrange
        const HttpStatusCode status = HttpStatusCode.BadRequest;
        var request = new RegisterPostRequestModel();
        var result = IAuthClient.Result.FromError(status, new ValidationProblemDetails
        {
            Status = (int)status,
            Detail = "Error"
        });

        _authClientMock
            .Setup(x => x.PostAuthRegisterAsync(request))
            .ReturnsAsync(result);

        // Act
        var response = await _registerController.Post(request);

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(result.Error)
        {
            StatusCode = (int)result.StatusCode
        });
    }

    #endregion
}