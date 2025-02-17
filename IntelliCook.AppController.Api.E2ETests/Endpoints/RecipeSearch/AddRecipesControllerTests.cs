using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.E2ETests.Fixtures;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.RecipeSearch.AddRecipes;
using IntelliCook.AppController.Api.Models.RecipeSearch.RecipeNutrition;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.RecipeSearch.Client;
using Moq;
using System.Net;
using System.Net.Http.Json;
using System.Text.Json;

namespace IntelliCook.AppController.Api.E2ETests.Endpoints.RecipeSearch;

[Collection(nameof(ClientFixture))]
public class AddRecipesControllerTests(ClientFixture fixture)
{
    private const string Path = "/RecipeSearch/AddRecipes";

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
        responseRecipe.Description = "Description";
        responseRecipe.Nutrition = new RecipeNutrition();
        responseRecipe.Nutrition.Calories = RecipeNutritionValue.High;
        responseRecipe.Nutrition.Fat = RecipeNutritionValue.Medium;
        responseRecipe.Nutrition.Protein = RecipeNutritionValue.Low;
        responseRecipe.Nutrition.Carbs = RecipeNutritionValue.None;
        var responseModel = new AddRecipesResponse();
        responseModel.Recipes.Add(responseRecipe);

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        fixture.RecipeSearchClientMock
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
        var response =
            await fixture.Client.PostAsync(Path, JsonContent.Create(request, options: fixture.SerializerOptions));

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.OK);
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var result =
            JsonSerializer.Deserialize<AddRecipesPostResponseModel>(content, fixture.SerializerOptions);
        result.Should().BeEquivalentTo(responseModel.ToPostResponseModel());
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

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        // Act
        var response =
            await fixture.Client.PostAsync(Path, JsonContent.Create(request, options: fixture.SerializerOptions));

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.Forbidden);
    }

    [Fact]
    public async void Post_WhenUserIsNotAuthenticated_ReturnsUnauthorized()
    {
        // Arrange
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