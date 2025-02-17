using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.Controllers.RecipeSearch;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.RecipeSearch.AddRecipes;
using IntelliCook.AppController.Api.Models.RecipeSearch.RecipeNutrition;
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
                    Title = "Title",
                    Description = "Description",
                    Ingredients = Array.Empty<AddRecipesRecipeIngredientModel>(),
                    Directions = Array.Empty<string>(),
                    Tips = Array.Empty<string>(),
                    Utensils = Array.Empty<string>(),
                    Nutrition = new RecipeNutritionModel()
                    {
                        Calories = RecipeNutritionValueModel.High,
                        Fat = RecipeNutritionValueModel.Medium,
                        Protein = RecipeNutritionValueModel.Low,
                        Carbs = RecipeNutritionValueModel.High,
                    }
                }
            }
        };
        var responseRecipe = new AddRecipesResponseRecipe();
        responseRecipe.Id = 1;
        responseRecipe.Title = request.Recipes.First().Title;
        responseRecipe.Nutrition = new RecipeNutrition();
        responseRecipe.Nutrition.Calories = RecipeNutritionValue.High;
        responseRecipe.Nutrition.Fat = RecipeNutritionValue.Medium;
        responseRecipe.Nutrition.Protein = RecipeNutritionValue.Low;
        responseRecipe.Nutrition.Carbs = RecipeNutritionValue.None;
        var responseModel = new AddRecipesResponse();
        responseModel.Recipes.Add(responseRecipe);

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        _recipeSearchClientMock
            .Setup(x => x.AddRecipesAsync(
                It.Is<AddRecipesRequest>(r =>
                    r.Recipes.Count == responseModel.Recipes.Count &&
                    r.Recipes.First().Title == request.Recipes.First().Title
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
                    Title = "Title"
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