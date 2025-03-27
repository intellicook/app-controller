using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.Controllers.IngredientRecognition;
using IntelliCook.AppController.Api.Models.IngredientRecognition;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.IngredientRecognition.Client;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System.Net;

namespace IntelliCook.AppController.Api.UnitTests.Controllers.IngredientRecognition;

public class SelectIngredientControllerTests
{
    private readonly SelectIngredientController _selectIngredientController;
    private readonly Mock<IAuthClient> _authClientMock = new();

    private readonly Mock<IngredientRecognitionService.IngredientRecognitionServiceClient>
        _ingredientRecognitionClientMock = new();

    public SelectIngredientControllerTests()
    {
        _selectIngredientController =
            new SelectIngredientController(_authClientMock.Object, _ingredientRecognitionClientMock.Object);
    }

    private class MockAsyncStreamReader<T>(T response) : IAsyncStreamReader<T>
    {
        private bool _hasNext = true;

        public T Current { get; } = response;

        public Task<bool> MoveNext(CancellationToken cancellationToken)
        {
            if (!_hasNext)
            {
                return Task.FromResult(false);
            }

            _hasNext = false;
            return Task.FromResult(true);
        }
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
        var responseModel = new FileContentResult("Updated Image"u8.ToArray(), "image/jpeg")
        {
            FileDownloadName = "Name"
        };
        var image = new FormFile(new MemoryStream("Image"u8.ToArray()), 0, 5, "Image", "Image");
        var request = new SelectIngredientPostRequest
        {
            X = 1,
            Y = 2,
        };
        var requestStreamMock = new Mock<IClientStreamWriter<SelectIngredientStreamRequest>>();
        var responseStreamMock = new MockAsyncStreamReader<SelectIngredientStreamResponse>(
            new SelectIngredientStreamResponse
            {
                Image = Google.Protobuf.ByteString.CopyFrom("Updated Image"u8.ToArray()),
                Name = "Name"
            });

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        _ingredientRecognitionClientMock
            .Setup(x => x.SelectIngredientStream(null, null, default))
            .Returns(new AsyncDuplexStreamingCall<SelectIngredientStreamRequest, SelectIngredientStreamResponse>(
                requestStreamMock.Object,
                responseStreamMock,
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));

        // Act
        var response = await _selectIngredientController.Post(image, request);

        // Assert
        response.Should().BeEquivalentTo(responseModel);
    }

    [Fact]
    public async void Post_WhenImageIsEmpty_ReturnsBadRequest()
    {
        // Arrange
        var image = new FormFile(new MemoryStream(), 0, 0, "Image", "Image");
        var request = new SelectIngredientPostRequest
        {
            X = 1,
            Y = 2,
        };

        // Act
        var response = await _selectIngredientController.Post(image, request);

        // Assert
        response.Should().BeEquivalentTo(new BadRequestResult());
    }

    [Fact]
    public async void Post_WhenUserIsNotAuthenticated_ReturnsUnauthorized()
    {
        // Arrange
        var image = new FormFile(new MemoryStream("Image"u8.ToArray()), 0, 5, "Image", "Image");
        var request = new SelectIngredientPostRequest
        {
            X = 1,
            Y = 2,
        };

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.Unauthorized));

        // Act
        var response = await _selectIngredientController.Post(image, request);

        // Assert
        response.Should().BeEquivalentTo(new UnauthorizedResult());
    }

    #endregion
}