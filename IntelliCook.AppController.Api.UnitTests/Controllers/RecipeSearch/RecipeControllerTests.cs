using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.Controllers.RecipeSearch;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.RecipeSearch.Client;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System.Net;

namespace IntelliCook.AppController.Api.UnitTests.Controllers.RecipeSearch;

public class RecipeControllerTests
{
    private readonly RecipeController _recipeController;
    private readonly Mock<IAuthClient> _authClientMock = new();
    private readonly Mock<RecipeSearchService.RecipeSearchServiceClient> _recipeSearchClientMock = new();

    public RecipeControllerTests()
    {
        _recipeController = new RecipeController(_authClientMock.Object, _recipeSearchClientMock.Object);
    }

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
            Email = "Example@Email.com"
        };
        var responseModel = new RecipeResponse();
        responseModel.Name = "Name";
        responseModel.Ingredients.Add("Ingredient");
        responseModel.Instructions.Add("Instruction");

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        _recipeSearchClientMock
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
        var response = await _recipeController.Get(id);

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(responseModel.ToGetResponseModel())
        {
            StatusCode = (int)HttpStatusCode.OK
        });
    }

    [Fact]
    public async void Get_WhenUserIsNotAuthenticated_ReturnsUnauthorized()
    {
        // Arrange
        var id = 1;

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.Unauthorized));

        // Act
        var response = await _recipeController.Get(id);

        // Assert
        response.Should().BeEquivalentTo(new UnauthorizedResult());
    }

    #endregion
}