using FluentAssertions;
using IntelliCook.AppController.Api.Controllers.Admin;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System.Net;

namespace IntelliCook.AppController.Api.UnitTests.Controllers.Admin;

public class UsersControllerTests
{
    private readonly UsersController _usersController;
    private readonly Mock<IAuthClient> _authClientMock = new();

    public UsersControllerTests()
    {
        _usersController = new UsersController(_authClientMock.Object);
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
        var responseModels = new[] { responseModel };
        var result = IAuthClient.Result<IEnumerable<UserGetResponseModel>>.FromValue(
            HttpStatusCode.OK, responseModels
        );

        _authClientMock
            .Setup(x => x.GetAdminUsersAsync())
            .ReturnsAsync(result);

        // Act
        var response = await _usersController.Get();

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(responseModels)
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
        var result = IAuthClient.Result<IEnumerable<UserGetResponseModel>>.FromError(
            status, error
        );

        _authClientMock
            .Setup(x => x.GetAdminUsersAsync())
            .ReturnsAsync(result);

        // Act
        var response = await _usersController.Get();

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(result.Error)
        {
            StatusCode = (int)result.StatusCode
        });
    }

    #endregion
}