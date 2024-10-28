using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.Controllers.RecipeSearch;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipesByIngredients;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.RecipeSearch.Client;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System.Net;

namespace IntelliCook.AppController.Api.UnitTests.Controllers.RecipeSearch;

public class SearchRecipesByIngredientsControllerTests
{
    private readonly SearchRecipesByIngredientsController _searchRecipesByIngredientsController;
    private readonly Mock<IAuthClient> _authClientMock = new();
    private readonly Mock<RecipeSearchService.RecipeSearchServiceClient> _recipeSearchClientMock = new();

    public SearchRecipesByIngredientsControllerTests()
    {
        _searchRecipesByIngredientsController =
            new SearchRecipesByIngredientsController(_authClientMock.Object, _recipeSearchClientMock.Object);
    }

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

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        _recipeSearchClientMock
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
            await _searchRecipesByIngredientsController.Post(request);

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(responseModel.ToPostResponseModel())
        {
            StatusCode = (int)HttpStatusCode.OK
        });
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

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        _recipeSearchClientMock
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
            await _searchRecipesByIngredientsController.Post(request);

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(responseModel.ToPostResponseModel())
        {
            StatusCode = (int)HttpStatusCode.OK
        });
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

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.Unauthorized));

        // Act
        var response =
            await _searchRecipesByIngredientsController.Post(request);

        // Assert
        response.Should().BeEquivalentTo(new UnauthorizedResult());
    }

    #endregion
}