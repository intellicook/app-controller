using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.E2ETests.Fixtures;
using IntelliCook.AppController.Api.Models.IngredientRecognition;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.IngredientRecognition.Client;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Moq;
using System.Net;

namespace IntelliCook.AppController.Api.E2ETests.Endpoints.IngredientRecognition;

[Collection(nameof(ClientFixture))]
public class SelectIngredientControllerTests(ClientFixture fixture)
{
    private const string Path = "/IngredientRecognition/SelectIngredient";

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
            Email = "Email@Example.com",
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

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        fixture.IngredientRecognitionClientMock
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
        var response = await fixture.Client.PostAsync(Path, new MultipartFormDataContent
        {
            { new StreamContent(image.OpenReadStream()), "image", image.FileName },
            { new StringContent(request.X.ToString()), "x" },
            { new StringContent(request.Y.ToString()), "y" }
        });

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.OK);
        response.Content.Headers.ContentType?.MediaType.Should().Be("image/jpeg");
        response.Content.Headers.ContentDisposition?.FileName.Should().Be(responseModel.FileDownloadName);
        var content = await response.Content.ReadAsByteArrayAsync();
        content.Should().BeEquivalentTo(responseModel.FileContents);

        requestStreamMock.Verify(
            x => x.WriteAsync(It.Is<SelectIngredientStreamRequest>(r =>
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
        var request = new SelectIngredientPostRequest
        {
            X = 1,
            Y = 2,
        };

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        // Act
        var response = await fixture.Client.PostAsync(Path, new MultipartFormDataContent
        {
            { new StreamContent(image.OpenReadStream()), "image", image.FileName },
            { new StringContent(request.X.ToString()), "x" },
            { new StringContent(request.Y.ToString()), "y" }
        });

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.BadRequest);
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

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.Unauthorized));

        // Act
        var response = await fixture.Client.PostAsync(Path, new MultipartFormDataContent
        {
            { new StreamContent(image.OpenReadStream()), "image", image.FileName },
            { new StringContent(request.X.ToString()), "x" },
            { new StringContent(request.Y.ToString()), "y" }
        });

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.Unauthorized);
    }

    #endregion
}