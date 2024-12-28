using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.E2ETests.Fixtures;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipes;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.RecipeSearch.Client;
using Moq;
using System.Net;
using System.Net.Http.Json;
using System.Text.Json;

namespace IntelliCook.AppController.Api.E2ETests.Endpoints.RecipeSearch;

[Collection(nameof(ClientFixture))]
public class SearchRecipesControllerTests(ClientFixture fixture)
{
    private const string Path = "/RecipeSearch/SearchRecipes";

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
        var request = new SearchRecipesPostRequestModel
        {
            Ingredients = new[] { "Ingredient" },
            Page = 1,
            PerPage = 1,
            IncludeDetail = true
        };
        var responseDetail = new SearchRecipesRecipeDetail();
        responseDetail.Instructions.Add("Instruction");
        responseDetail.Raw = "Raw";
        var responseMatch = new SearchRecipesMatch();
        responseMatch.Field = SearchRecipesMatchField.Name;
        responseMatch.Tokens.Add("Token");
        var responseRecipe = new SearchRecipesRecipe();
        responseRecipe.Id = 1;
        responseRecipe.Name = "Name";
        responseRecipe.Ingredients.Add("Ingredient");
        responseRecipe.Matches.Add(responseMatch);
        responseRecipe.Detail = responseDetail;
        var responseModel = new SearchRecipesResponse();
        responseModel.Recipes.Add(responseRecipe);

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        fixture.RecipeSearchClientMock
            .Setup(x => x.SearchRecipesAsync(
                It.Is<SearchRecipesRequest>(
                    r => r.Username == user.Username &&
                         r.Page == request.Page &&
                         r.PerPage == request.PerPage &&
                         r.IncludeDetail == request.IncludeDetail &&
                         r.Ingredients.Count == request.Ingredients.Count() &&
                         r.Ingredients.All(request.Ingredients.Contains)
                ),
                null, null, default
            ))
            .Returns(new AsyncUnaryCall<SearchRecipesResponse>(
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
            JsonSerializer.Deserialize<SearchRecipesPostResponseModel>(content, fixture.SerializerOptions);
        result.Should().BeEquivalentTo(responseModel.ToPostResponseModel());
    }

    [Fact]
    public async void Post_WhenOptionalFieldsAreNull_DoesNotSetOptionalFieldsAndReturnsSuccess()
    {
        // Arrange
        var user = new UserGetResponseModel
        {
            Name = "Name",
            Role = UserRoleModel.User,
            Username = "Username",
            Email = "Email@Example.com"
        };
        var request = new SearchRecipesPostRequestModel
        {
            Ingredients = new[] { "Ingredient" }
        };
        var responseMatch = new SearchRecipesMatch();
        responseMatch.Field = SearchRecipesMatchField.Name;
        responseMatch.Tokens.Add("Token");
        var responseRecipe = new SearchRecipesRecipe();
        responseRecipe.Id = 1;
        responseRecipe.Name = "Name";
        responseRecipe.Ingredients.Add("Ingredient");
        responseRecipe.Matches.Add(responseMatch);
        var responseModel = new SearchRecipesResponse();
        responseModel.Recipes.Add(responseRecipe);

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        fixture.RecipeSearchClientMock
            .Setup(x => x.SearchRecipesAsync(
                It.Is<SearchRecipesRequest>(
                    r => r.Username == user.Username &&
                         !r.HasPage &&
                         !r.HasPerPage &&
                         !r.HasIncludeDetail &&
                         r.Ingredients.Count == request.Ingredients.Count() &&
                         r.Ingredients.All(request.Ingredients.Contains)
                ),
                null, null, default
            ))
            .Returns(new AsyncUnaryCall<SearchRecipesResponse>(
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
            JsonSerializer.Deserialize<SearchRecipesPostResponseModel>(content, fixture.SerializerOptions);
        result.Should().BeEquivalentTo(responseModel.ToPostResponseModel());
    }

    [Fact]
    public async void Post_WhenUserIsNotAuthenticated_ReturnsUnauthorized()
    {
        // Arrange
        var request = new SearchRecipesPostRequestModel
        {
            Ingredients = new[] { "Ingredient" },
            Page = 1,
            PerPage = 1,
            IncludeDetail = false
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