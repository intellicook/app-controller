using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.E2ETests.Fixtures;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipesByIngredients;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.RecipeSearch.Client;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System.Net;
using System.Net.Http.Json;
using System.Text.Json;

namespace IntelliCook.AppController.Api.E2ETests.Endpoints.RecipeSearch;

[Collection(nameof(ClientFixture))]
public class SearchRecipesByIngredientsControllerTests(ClientFixture fixture)
{
    private const string Path = "/RecipeSearch/SearchRecipesByIngredients";

    #region Post

    [Fact]
    public async void Post_WhenSuccessful_ReturnsSuccess()
    {
        // Arrange
        var user = new UserGetResponseModel
        {
            Name = "Name",
            Role = UserRoleModel.User,
            Username = "Username",
            Email = "Email@Example.com"
        };
        var request = new SearchRecipesByIngredientsPostRequestModel
        {
            Ingredients = new[] { "Ingredient" },
            Limit = 1
        };
        var responseModel = new SearchRecipesByIngredientsResponse();
        responseModel.Recipes.Add(new SearchRecipesByIngredientsRecipe
        {
            Id = 1,
            Distance = 0.5f,
            Name = "Name"
        });

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        fixture.RecipeSearchClientMock
            .Setup(x => x.SearchRecipesByIngredientsAsync(
                It.Is<SearchRecipesByIngredientsRequest>(
                    r => r.Username == user.Username &&
                         r.Limit == request.Limit &&
                         r.Ingredients.Count == request.Ingredients.Count() &&
                         r.Ingredients[0] == request.Ingredients.First()
                ),
                null, null, default
            ))
            .Returns(new AsyncUnaryCall<SearchRecipesByIngredientsResponse>(
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

        var result =
            JsonSerializer.Deserialize<SearchRecipesByIngredientsPostResponseModel>(content, fixture.SerializerOptions);
        result.Should().BeEquivalentTo(responseModel.ToPostResponseModel());
    }

    [Fact]
    public async void Post_WhenLimitIsNull_DoesNotSetLimitAndReturnsSuccess()
    {
        // Arrange
        var user = new UserGetResponseModel
        {
            Name = "Name",
            Role = UserRoleModel.User,
            Username = "Username",
            Email = "Email@Example.com"
        };
        var request = new SearchRecipesByIngredientsPostRequestModel
        {
            Ingredients = new[] { "Ingredient" },
            Limit = null
        };
        var responseModel = new SearchRecipesByIngredientsResponse();
        responseModel.Recipes.Add(new SearchRecipesByIngredientsRecipe
        {
            Id = 1,
            Distance = 0.5f,
            Name = "Name"
        });

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        fixture.RecipeSearchClientMock
            .Setup(x => x.SearchRecipesByIngredientsAsync(
                It.Is<SearchRecipesByIngredientsRequest>(
                    r => r.Username == user.Username &&
                         !r.HasLimit &&
                         r.Ingredients.Count == request.Ingredients.Count() &&
                         r.Ingredients[0] == request.Ingredients.First()
                ),
                null, null, default
            ))
            .Returns(new AsyncUnaryCall<SearchRecipesByIngredientsResponse>(
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

        var result =
            JsonSerializer.Deserialize<SearchRecipesByIngredientsPostResponseModel>(content, fixture.SerializerOptions);
        result.Should().BeEquivalentTo(responseModel.ToPostResponseModel());
    }

    [Fact]
    public async void Post_WhenUserIsNotAuthenticated_ReturnsUnauthorized()
    {
        // Arrange
        var request = new SearchRecipesByIngredientsPostRequestModel
        {
            Ingredients = new[] { "Ingredient" },
            Limit = 1
        };

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.Unauthorized));

        // Act
        var response =
            await fixture.Client.PostAsync(Path, JsonContent.Create(request, options: fixture.SerializerOptions));

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.Unauthorized);
    }

    #endregion
}