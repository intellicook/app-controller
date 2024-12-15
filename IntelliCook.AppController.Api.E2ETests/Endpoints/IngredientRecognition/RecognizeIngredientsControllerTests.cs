using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.E2ETests.Fixtures;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.IngredientRecognition;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.IngredientRecognition.Client;
using Microsoft.AspNetCore.Http;
using Moq;
using System.Net;
using System.Text.Json;

namespace IntelliCook.AppController.Api.E2ETests.Endpoints.IngredientRecognition;

[Collection(nameof(ClientFixture))]
public class RecognizeIngredientsControllerTests(ClientFixture fixture)
{
    private const string Path = "/IngredientRecognition/RecognizeIngredients";

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
            Email = "Email@Example.com",
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

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        fixture.IngredientRecognitionClientMock
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
        var response = await fixture.Client.PostAsync(Path, new MultipartFormDataContent
        {
            { new StreamContent(image.OpenReadStream()), "image", image.FileName }
        });

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.OK);
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var result =
            JsonSerializer.Deserialize<RecognizeIngredientsPostResponseModel>(content, fixture.SerializerOptions);
        result.Should().BeEquivalentTo(responseModel.ToPostResponseModel());

        requestStreamMock.Verify(
            x => x.WriteAsync(It.Is<RecognizeIngredientsStreamRequest>(r =>
                r.Image == Google.Protobuf.ByteString.CopyFromUtf8("Image")
            )),
            Times.AtLeastOnce
        );
    }

    [Fact]
    public async void Post_WhenImageIsEmpty_ReturnsBadRequest()
    {
        // Arrange
        var user = new UserGetResponseModel
        {
            Name = "Name",
            Role = UserRoleModel.User,
            Username = "Username",
            Email = "Email@Example.com"
        };
        var image = new FormFile(new MemoryStream(""u8.ToArray()), 0, 0, "Image", "Image");

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        // Act
        var response = await fixture.Client.PostAsync(Path, new MultipartFormDataContent
        {
            { new StreamContent(image.OpenReadStream()), "image", image.FileName }
        });

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.BadRequest);
    }

    [Fact]
    public async void Post_WhenUserIsNotAuthenticated_ReturnsUnauthorized()
    {
        // Arrange
        var image = new FormFile(new MemoryStream("Image"u8.ToArray()), 0, 5, "Image", "Image");

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.Unauthorized));

        // Act
        var response = await fixture.Client.PostAsync(Path, new MultipartFormDataContent
        {
            { new StreamContent(image.OpenReadStream()), "image", image.FileName }
        });

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.Unauthorized);
    }

    #endregion
}