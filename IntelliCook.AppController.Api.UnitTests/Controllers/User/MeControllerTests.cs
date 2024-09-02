using FluentAssertions;
using IntelliCook.AppController.Api.Controllers.User;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System.Net;

namespace IntelliCook.AppController.Api.UnitTests.Controllers.User;

public class MeControllerTests
{
    private readonly MeController _meController;
    private readonly Mock<IAuthClient> _authClientMock = new();

    public MeControllerTests()
    {
        _meController = new MeController(_authClientMock.Object);
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
        var response = await _meController.Get();

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(responseModel)
        {
            StatusCode = (int)result.StatusCode
        });
    }

    [Fact]
    public async void Get_WhenResultHasError_ReturnsError()
    {
        // Arrange
        const HttpStatusCode status = HttpStatusCode.BadRequest;
        var error = new IntelliCook.Auth.Contract.ValidationProblemDetails
        {
            Status = (int)status,
            Detail = "Error"
        };
        var result = IAuthClient.Result<UserGetResponseModel>.FromError(
            status, error
        );

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(result);

        // Act
        var response = await _meController.Get();

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(result.Error)
        {
            StatusCode = (int)result.StatusCode
        });
    }

    #endregion

    #region Put

    [Fact]
    public async void Put_WhenResultIsSuccessful_ReturnsSuccess()
    {
        // Arrange
        var request = new UserPutRequestModel();
        var result = IAuthClient.Result.FromValue(HttpStatusCode.NoContent);

        _authClientMock
            .Setup(x => x.PutUserMeAsync(request))
            .ReturnsAsync(result);

        // Act
        var response = await _meController.Put(request);

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(null)
        {
            StatusCode = (int)result.StatusCode
        });
    }

    [Fact]
    public async void Put_WhenResultHasError_ReturnsError()
    {
        // Arrange
        var request = new UserPutRequestModel();
        const HttpStatusCode status = HttpStatusCode.BadRequest;
        var error = new IntelliCook.Auth.Contract.ValidationProblemDetails
        {
            Status = (int)status,
            Detail = "Error"
        };
        var result = IAuthClient.Result.FromError(
            status, error
        );

        _authClientMock
            .Setup(x => x.PutUserMeAsync(It.IsAny<UserPutRequestModel>()))
            .ReturnsAsync(result);

        // Act
        var response = await _meController.Put(request);

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(result.Error)
        {
            StatusCode = (int)result.StatusCode
        });
    }

    #endregion

    #region PutPassword

    [Fact]
    public async void PutPassword_WhenResultIsSuccessful_ReturnsSuccess()
    {
        // Arrange
        var request = new UserPasswordPutRequestModel();
        var result = IAuthClient.Result.FromValue(HttpStatusCode.NoContent);

        _authClientMock
            .Setup(x => x.PutUserMePasswordAsync(request))
            .ReturnsAsync(result);

        // Act
        var response = await _meController.PutPassword(request);

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(null)
        {
            StatusCode = (int)result.StatusCode
        });
    }

    [Fact]
    public async void PutPassword_WhenResultHasError_ReturnsError()
    {
        // Arrange
        var request = new UserPasswordPutRequestModel();
        const HttpStatusCode status = HttpStatusCode.BadRequest;
        var error = new IntelliCook.Auth.Contract.ValidationProblemDetails
        {
            Status = (int)status,
            Detail = "Error"
        };
        var result = IAuthClient.Result.FromError(
            status, error
        );

        _authClientMock
            .Setup(x => x.PutUserMePasswordAsync(It.IsAny<UserPasswordPutRequestModel>()))
            .ReturnsAsync(result);

        // Act
        var response = await _meController.PutPassword(request);

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(result.Error)
        {
            StatusCode = (int)result.StatusCode
        });
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
        var response = await _meController.Delete();

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(null)
        {
            StatusCode = (int)result.StatusCode
        });
    }

    [Fact]
    public async void Delete_WhenResultHasError_ReturnsError()
    {
        // Arrange
        const HttpStatusCode status = HttpStatusCode.BadRequest;
        var error = new IntelliCook.Auth.Contract.ValidationProblemDetails
        {
            Status = (int)status,
            Detail = "Error"
        };
        var result = IAuthClient.Result.FromError(
            status, error
        );

        _authClientMock
            .Setup(x => x.DeleteUserMeAsync())
            .ReturnsAsync(result);

        // Act
        var response = await _meController.Delete();

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(result.Error)
        {
            StatusCode = (int)result.StatusCode
        });
    }

    #endregion
}