using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.Controllers.RecipeSearch;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.RecipeSearch.Client;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System.Net;

namespace IntelliCook.AppController.Api.UnitTests.Controllers.RecipeSearch;

public class UserProfileControllerTests
{
    private readonly UserProfileController _userProfileController;
    private readonly Mock<IAuthClient> _authClientMock = new();
    private readonly Mock<RecipeSearchService.RecipeSearchServiceClient> _recipeSearchClientMock = new();

    public UserProfileControllerTests()
    {
        _userProfileController = new UserProfileController(_authClientMock.Object, _recipeSearchClientMock.Object);
    }

    #region Get

    [Fact]
    public async void Get_WhenSuccessful_ReturnsSuccess()
    {
        // Arrange
        var user = new UserGetResponseModel
        {
            Name = "Name",
            Role = UserRoleModel.User,
            Username = "Username",
            Email = "Email@Example.com"
        };
        var responseModel = new UserProfileResponse();
        responseModel.VeggieIdentity = UserProfileVeggieIdentity.Vegan;

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        _recipeSearchClientMock
            .Setup(x => x.GetUserProfileAsync(
                It.Is<UserProfileRequest>(r => r.Username == user.Username),
                null, null, default
            ))
            .Returns(new AsyncUnaryCall<UserProfileResponse>(
                Task.FromResult(responseModel),
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));

        // Act
        var response = await _userProfileController.Get();

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(responseModel.ToGetResponseModel())
        {
            StatusCode = (int)HttpStatusCode.OK
        });
    }

    #endregion
}