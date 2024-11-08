using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.E2ETests.Fixtures;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.RecipeSearch.Recipe;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.RecipeSearch.Client;
using Moq;
using System.Net;
using System.Text.Json;

namespace IntelliCook.AppController.Api.E2ETests.Endpoints.RecipeSearch;

[Collection(nameof(ClientFixture))]
public class RecipeControllerTests(ClientFixture fixture)
{
    private const string Path = "/RecipeSearch/Recipe";

    #region Get

    [Fact]
    public async void Get_WhenSuccessful_ReturnsSuccess()
    {
        // Arrange
        var id = 1;
        var user = new UserGetResponseModel
        {
            Name = "Name",
            Role = UserRoleModel.User,
            Username = "Username",
            Email = "Email@Example.com"
        };
        var responseModel = new RecipeResponse();
        responseModel.Id = id;
        responseModel.Name = "Name";
        responseModel.Ingredients.Add("Ingredient");
        responseModel.Instructions.Add("Instruction");
        responseModel.Raw = "Raw";

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        fixture.RecipeSearchClientMock
            .Setup(x => x.GetRecipeAsync(
                It.Is<RecipeRequest>(r => r.Id == id),
                null, null, default
            ))
            .Returns(new AsyncUnaryCall<RecipeResponse>(
                Task.FromResult(responseModel),
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));

        // Act
        var response = await fixture.Client.GetAsync($"{Path}/{id}");

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.OK);
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var result =
            JsonSerializer.Deserialize<RecipeGetResponseModel>(content, fixture.SerializerOptions);
        result.Should().BeEquivalentTo(responseModel.ToGetResponseModel());
    }

    [Fact]
    public async void Get_WhenUserIsNotAuthenticated_ReturnsUnauthorized()
    {
        // Arrange
        var id = 1;

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.Unauthorized));

        // Act
        var response = await fixture.Client.GetAsync($"{Path}/{id}");

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.Unauthorized);
    }

    #endregion
}