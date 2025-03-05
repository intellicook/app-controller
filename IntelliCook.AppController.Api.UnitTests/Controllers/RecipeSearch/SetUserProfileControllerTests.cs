using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.Controllers.RecipeSearch;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.RecipeSearch.SetUserProfile;
using IntelliCook.AppController.Api.Models.RecipeSearch.UserProfile;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.RecipeSearch.Client;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System.Net;

namespace IntelliCook.AppController.Api.UnitTests.Controllers.RecipeSearch;

public class SetUserProfileControllerTests
{
    private readonly SetUserProfileController _setUserProfileController;
    private readonly Mock<IAuthClient> _authClientMock = new();
    private readonly Mock<RecipeSearchService.RecipeSearchServiceClient> _recipeSearchClientMock = new();

    public SetUserProfileControllerTests()
    {
        _setUserProfileController = new SetUserProfileController(_authClientMock.Object, _recipeSearchClientMock.Object);
    }

    #region Post

    [Fact]
    public async void Post_WhenSuccessful_ReturnsSuccess()
    {
        // Arrange
        var user = new UserGetResponseModel
        {
            Name = "Name",
            Role = UserRoleModel.Admin,
            Username = "Username",
            Email = "Email@Example.com"
        };
        var request = new SetUserProfilePostRequestModel
        {
            VeggieIdentity = UserProfileVeggieIdentityModel.Vegan,
            Prefer = Array.Empty<string>(),
            Dislike = Array.Empty<string>()
        };
        var responseModel = new SetUserProfileResponse();
        responseModel.Username = user.Username;
        responseModel.VeggieIdentity = UserProfileVeggieIdentity.Vegan;

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        _recipeSearchClientMock
            .Setup(x => x.SetUserProfileAsync(
                It.Is<SetUserProfileRequest>(r =>
                    r.Username == user.Username &&
                    r.VeggieIdentity == UserProfileVeggieIdentity.Vegan
                ),
                null, null, default
            ))
            .Returns(new AsyncUnaryCall<SetUserProfileResponse>(
                Task.FromResult(responseModel),
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));

        // Act
        var response = await _setUserProfileController.Post(request);

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(responseModel.ToPostResponseModel())
        {
            StatusCode = (int)HttpStatusCode.OK
        });
    }

    #endregion
}