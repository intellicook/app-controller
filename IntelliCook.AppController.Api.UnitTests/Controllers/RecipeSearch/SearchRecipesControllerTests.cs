using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.Controllers.RecipeSearch;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.RecipeSearch.SearchRecipes;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.RecipeSearch.Client;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System.Net;

namespace IntelliCook.AppController.Api.UnitTests.Controllers.RecipeSearch;

public class SearchRecipesControllerTests
{
    private readonly SearchRecipesController _searchRecipesController;
    private readonly Mock<IAuthClient> _authClientMock = new();
    private readonly Mock<RecipeSearchService.RecipeSearchServiceClient> _recipeSearchClientMock = new();

    public SearchRecipesControllerTests()
    {
        _searchRecipesController =
            new SearchRecipesController(_authClientMock.Object, _recipeSearchClientMock.Object);
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
        var responseRecipe = new SearchRecipesRecipe();
        responseRecipe.Id = 1;
        responseRecipe.Name = "Name";
        responseRecipe.Ingredients.Add("Ingredient");
        responseRecipe.Detail = responseDetail;
        var responseModel = new SearchRecipesResponse();
        responseModel.Recipes.Add(responseRecipe);

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        _recipeSearchClientMock
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
        var response = await _searchRecipesController.Post(request);

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(responseModel.ToPostResponseModel())
        {
            StatusCode = (int)HttpStatusCode.OK
        });
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
        var responseRecipe = new SearchRecipesRecipe();
        responseRecipe.Id = 1;
        responseRecipe.Name = "Name";
        responseRecipe.Ingredients.Add("Ingredient");
        var responseModel = new SearchRecipesResponse();
        responseModel.Recipes.Add(responseRecipe);

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        _recipeSearchClientMock
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
        var response = await _searchRecipesController.Post(request);

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
        var request = new SearchRecipesPostRequestModel
        {
            Ingredients = new[] { "Ingredient" },
            Page = 1,
            PerPage = 1,
            IncludeDetail = false
        };

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.Unauthorized));

        // Act
        var response = await _searchRecipesController.Post(request);

        // Assert
        response.Should().BeEquivalentTo(new UnauthorizedResult());
    }

    #endregion
}