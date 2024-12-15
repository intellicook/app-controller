using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.Controllers.IngredientRecognition;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.IngredientRecognition.Client;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System.Net;

namespace IntelliCook.AppController.Api.UnitTests.Controllers.IngredientRecognition;

public class RecognizeIngredientsControllerTests
{
    private readonly RecognizeIngredientsController _recognizeIngredientsController;
    private readonly Mock<IAuthClient> _authClientMock = new();
    private readonly Mock<IngredientRecognitionService.IngredientRecognitionServiceClient> _ingredientRecognitionClientMock = new();

    public RecognizeIngredientsControllerTests()
    {
        _recognizeIngredientsController = new RecognizeIngredientsController(_authClientMock.Object, _ingredientRecognitionClientMock.Object);
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
        var responseModel = new RecognizeIngredientsResponse();
        responseModel.Ingredients.Add(new RecognizeIngredientsIngredient()
        {
            Name = "Ingredient",
            X = 1,
            Y = 2,
            Width = 3,
            Height = 4
        });
        var image = new FormFile(new MemoryStream("Image"u8.ToArray()), 0, 5, "Image", "Image");
        var requestStreamMock = new Mock<IClientStreamWriter<RecognizeIngredientsStreamRequest>>();

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        _ingredientRecognitionClientMock
            .Setup(x => x.RecognizeIngredientsStream(null, null, default))
            .Returns(new AsyncClientStreamingCall<RecognizeIngredientsStreamRequest, RecognizeIngredientsResponse>(
                requestStreamMock.Object,
                Task.FromResult(responseModel),
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));

        // Act
        var response = await _recognizeIngredientsController.Post(image);

        // Assert
        response.Should().BeEquivalentTo(new ObjectResult(responseModel.ToPostResponseModel())
        {
            StatusCode = (int)HttpStatusCode.OK
        });
    }

    [Fact]
    public async void Post_WhenImageIsEmpty_ReturnsBadRequest()
    {
        // Arrange
        var image = new FormFile(new MemoryStream(), 0, 0, "Image", "Image");

        // Act
        var response = await _recognizeIngredientsController.Post(image);

        // Assert
        response.Should().BeEquivalentTo(new BadRequestResult());
    }

    [Fact]
    public async void Post_WhenUserIsNotAuthenticated_ReturnsUnauthorized()
    {
        // Arrange
        var image = new FormFile(new MemoryStream("Image"u8.ToArray()), 0, 5, "Image", "Image");

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.Unauthorized));

        // Act
        var response = await _recognizeIngredientsController.Post(image);

        // Assert
        response.Should().BeEquivalentTo(new UnauthorizedResult());
    }

    #endregion
}