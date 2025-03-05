using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.Controllers.RecipeSearch;
using IntelliCook.AppController.Api.E2ETests.Fixtures;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.RecipeSearch.SetUserProfile;
using IntelliCook.AppController.Api.Models.RecipeSearch.UserProfile;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.RecipeSearch.Client;
using Moq;
using System.Net;
using System.Net.Http.Json;
using System.Text.Json;

namespace IntelliCook.AppController.Api.E2ETests.Endpoints.RecipeSearch;

[Collection(nameof(ClientFixture))]
public class SetUserProfileControllerTests(ClientFixture fixture)
{
    private const string Path = "/RecipeSearch/SetUserProfile";

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

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        fixture.RecipeSearchClientMock
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
        var response =
            await fixture.Client.PostAsync(Path, JsonContent.Create(request, options: fixture.SerializerOptions));

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.OK);
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var result = JsonSerializer.Deserialize<SetUserProfilePostResponseModel>(content, fixture.SerializerOptions);
        result.Should().BeEquivalentTo(responseModel.ToPostResponseModel());
    }

    #endregion
}