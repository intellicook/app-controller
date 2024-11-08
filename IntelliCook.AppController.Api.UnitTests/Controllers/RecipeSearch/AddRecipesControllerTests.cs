using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.Controllers.RecipeSearch;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.RecipeSearch.AddRecipes;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.RecipeSearch.Client;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System.Net;

namespace IntelliCook.AppController.Api.UnitTests.Controllers.RecipeSearch;

public class AddRecipesControllerTests
{
    private readonly AddRecipesController _addRecipesController;
    private readonly Mock<IAuthClient> _authClientMock = new();
    private readonly Mock<RecipeSearchService.RecipeSearchServiceClient> _recipeSearchClientMock = new();

    public AddRecipesControllerTests()
    {
        _addRecipesController = new AddRecipesController(_authClientMock.Object, _recipeSearchClientMock.Object);
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
        var request = new AddRecipesPostRequestModel
        {
            Recipes = new[]
            {
                new AddRecipesRequestRecipeModel
                {
                    Name = "Name",
                    Ingredients = new[] { "Ingredient" },
                    Instructions = new[] { "Instruction" },
                    Raw = "Raw"
                }
            }
        };
        var responseRecipe = new AddRecipesResponseRecipe();
        responseRecipe.Id = 1;
        responseRecipe.Name = request.Recipes.First().Name;
        responseRecipe.Ingredients.AddRange(request.Recipes.First().Ingredients);
        responseRecipe.Instructions.AddRange(request.Recipes.First().Instructions);
        responseRecipe.Raw = request.Recipes.First().Raw;
        var responseModel = new AddRecipesResponse();
        responseModel.Recipes.Add(responseRecipe);

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        _recipeSearchClientMock
            .Setup(x => x.AddRecipesAsync(
                It.Is<AddRecipesRequest>(r =>
                    r.Recipes.Count == responseModel.Recipes.Count &&
                    r.Recipes.First().Name == request.Recipes.First().Name &&
                    r.Recipes.First().Ingredients.Count == request.Recipes.First().Ingredients.Count() &&
                    r.Recipes.First().Instructions.Count == request.Recipes.First().Instructions.Count() &&
                    r.Recipes.First().Raw == request.Recipes.First().Raw
                ),
                null, null, default
            ))
            .Returns(new AsyncUnaryCall<AddRecipesResponse>(
                Task.FromResult(responseModel),
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));

        // Act
        var response = await _addRecipesController.Post(request);

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(responseModel.ToPostResponseModel())
        {
            StatusCode = (int)HttpStatusCode.OK
        });
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
        var request = new AddRecipesPostRequestModel
        {
            Recipes = new[]
            {
                new AddRecipesRequestRecipeModel
                {
                    Name = "Name",
                    Ingredients = new[] { "Ingredient" },
                    Instructions = new[] { "Instruction" },
                    Raw = "Raw"
                }
            }
        };

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        // Act
        var response = await _addRecipesController.Post(request);

        // Assert
        response.Should().BeEquivalentTo(_addRecipesController.Forbidden("Only admins can add recipes."));
    }

    [Fact]
    public async void Post_WhenUserIsNotAuthenticated_ReturnsUnauthorized()
    {
        // Arrange
        var request = new AddRecipesPostRequestModel();

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.Unauthorized));

        // Act
        var response = await _addRecipesController.Post(request);

        // Assert
        response.Should().BeEquivalentTo(new UnauthorizedResult());
    }

    #endregion
}