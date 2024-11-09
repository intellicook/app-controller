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

public class FaissIndexThreadControllerTests
{
    private readonly FaissIndexThreadController _faissIndexThreadController;
    private readonly Mock<IAuthClient> _authClientMock = new();
    private readonly Mock<RecipeSearchService.RecipeSearchServiceClient> _recipeSearchClientMock = new();

    public FaissIndexThreadControllerTests()
    {
        _faissIndexThreadController =
            new FaissIndexThreadController(_authClientMock.Object, _recipeSearchClientMock.Object);
    }

    #region Get

    [Fact]
    public async void Get_WhenSuccessful_ReturnsSuccess()
    {
        // Arrange
        var user = new UserGetResponseModel
        {
            Name = "Name",
            Role = UserRoleModel.Admin,
            Username = "Username",
            Email = "Email@Example.com"
        };
        var responseArgs = new FaissIndexThreadArgs();
        responseArgs.Count = 1;
        responseArgs.Model = "Model";
        responseArgs.Path = "Path";
        var responseModel = new FaissIndexThreadResponse();
        responseModel.Status = FaissIndexThreadStatus.Completed;
        responseModel.Args = responseArgs;

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        _recipeSearchClientMock
            .Setup(x => x.GetFaissIndexThreadAsync(
                It.IsAny<FaissIndexThreadRequest>(),
                null, null, default
            ))
            .Returns(new AsyncUnaryCall<FaissIndexThreadResponse>(
                Task.FromResult(responseModel),
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));

        // Act
        var response = await _faissIndexThreadController.Get();

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(responseModel.ToGetResponseModel())
        {
            StatusCode = (int)HttpStatusCode.OK
        });
    }

    [Fact]
    public async void Get_WhenUserIsNotAdmin_ReturnsForbidden()
    {
        // Arrange
        var user = new UserGetResponseModel
        {
            Name = "Name",
            Role = UserRoleModel.User,
            Username = "Username",
            Email = "Email@Example.com"
        };

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        // Act
        var response = await _faissIndexThreadController.Get();

        // Assert
        response.Should()
            .BeEquivalentTo(_faissIndexThreadController.Forbidden("Only admins can get Faiss index thread status."));
    }

    [Fact]
    public async void Get_WhenUserIsNotAuthenticated_ReturnsUnauthorized()
    {
        // Arrange
        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.Unauthorized));

        // Act
        var response = await _faissIndexThreadController.Get();

        // Assert
        response.Should().BeEquivalentTo(new UnauthorizedResult());
    }

    #endregion
}