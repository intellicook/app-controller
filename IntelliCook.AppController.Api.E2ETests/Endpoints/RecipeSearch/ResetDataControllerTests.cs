using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.E2ETests.Fixtures;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.RecipeSearch.Client;
using Moq;
using System.Net;

namespace IntelliCook.AppController.Api.E2ETests.Endpoints.RecipeSearch;

[Collection(nameof(ClientFixture))]
public class ResetDataControllerTests(ClientFixture fixture)
{
    private const string Path = "/RecipeSearch/ResetData";

    #region Delete

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

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        fixture.RecipeSearchClientMock
            .Setup(x => x.ResetDataAsync(
                It.IsAny<ResetDataRequest>(),
                null, null, default
            ))
            .Returns(new AsyncUnaryCall<ResetDataResponse>(
                Task.FromResult(new ResetDataResponse()),
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));

        // Act
        var response = await fixture.Client.DeleteAsync(Path);

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.NoContent);
    }

    [Fact]
    public async void Post_WhenUserIsNotAdmin_ReturnsForbidden()
    {
        // Arrange
        var user = new UserGetResponseModel
        {
            Name = "Name",
            Role = UserRoleModel.User,
            Username = "Username",
            Email = "Email@Example.com"
        };

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        // Act
        var response = await fixture.Client.DeleteAsync(Path);

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.Forbidden);
    }

    [Fact]
    public async void Post_WhenUserIsNotAuthenticated_ReturnsUnauthorized()
    {
        // Arrange
        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.Unauthorized));

        // Act
        var response = await fixture.Client.DeleteAsync(Path);

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.Unauthorized);
    }

    #endregion
}