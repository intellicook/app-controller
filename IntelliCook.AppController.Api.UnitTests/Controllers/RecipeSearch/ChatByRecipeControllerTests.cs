using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.Controllers.RecipeSearch;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.RecipeSearch.ChatByRecipe;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.RecipeSearch.Client;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Moq;
using System.Net;
using System.Text.Json;

namespace IntelliCook.AppController.Api.UnitTests.Controllers.RecipeSearch;

public class ChatByRecipeControllerTests
{
    private readonly ChatByRecipeController _chatByRecipeController;
    private readonly Mock<IAuthClient> _authClientMock = new();
    private readonly Mock<RecipeSearchService.RecipeSearchServiceClient> _recipeSearchClientMock = new();
    private readonly Mock<IOptions<JsonOptions>> _jsonOptionsMock = new();

    public ChatByRecipeControllerTests()
    {
        _jsonOptionsMock
            .Setup(x => x.Value)
            .Returns(new JsonOptions());

        _chatByRecipeController =
            new ChatByRecipeController(_authClientMock.Object, _recipeSearchClientMock.Object, _jsonOptionsMock.Object);
    }

    #region Post

    [Fact]
    public async void Post_WhenSuccessful_ReturnsSuccess()
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
        var messages = new[]
        {
            new ChatByRecipeMessageModel
            {
                Role = ChatByRecipeRoleModel.Assistant,
                Text = "Assistant Text"
            },
            new ChatByRecipeMessageModel
            {
                Role = ChatByRecipeRoleModel.User,
                Text = "User Text"
            }
        };
        var request = new ChatByRecipePostRequestModel
        {
            Id = id,
            Messages = messages
        };
        var responseModel = new ChatByRecipeResponse();
        responseModel.Message = new ChatByRecipeMessage
        {
            Role = ChatByRecipeRole.Assistant,
            Text = "Assistant Response Text"
        };

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        _recipeSearchClientMock
            .Setup(x => x.ChatByRecipeAsync(
                It.Is<ChatByRecipeRequest>(
                    r => r.Id == id &&
                         r.Username == user.Username &&
                         r.Messages.Count == messages.Length &&
                         r.Messages[0].Role.ToRoleModel() == messages[0].Role &&
                         r.Messages[0].Text == messages[0].Text &&
                         r.Messages[1].Role.ToRoleModel() == messages[1].Role &&
                         r.Messages[1].Text == messages[1].Text
                ),
                null, null, default
            ))
            .Returns(new AsyncUnaryCall<ChatByRecipeResponse>(
                Task.FromResult(responseModel),
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));

        // Act
        var response = await _chatByRecipeController.Post(request);

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
        var id = 1;
        var messages = new[]
        {
            new ChatByRecipeMessageModel
            {
                Role = ChatByRecipeRoleModel.Assistant,
                Text = "Assistant Text"
            },
            new ChatByRecipeMessageModel
            {
                Role = ChatByRecipeRoleModel.User,
                Text = "User Text"
            }
        };
        var request = new ChatByRecipePostRequestModel
        {
            Id = id,
            Messages = messages
        };

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.Unauthorized));

        // Act
        var response = await _chatByRecipeController.Post(request);

        // Assert
        response.Should().BeEquivalentTo(new UnauthorizedResult());
    }

    #endregion

    #region PostStream

    [Fact]
    public async void PostStream_WhenSuccessful_ReturnsSuccess()
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
        var messages = new[]
        {
            new ChatByRecipeMessageModel
            {
                Role = ChatByRecipeRoleModel.Assistant,
                Text = "Assistant Text"
            },
            new ChatByRecipeMessageModel
            {
                Role = ChatByRecipeRoleModel.User,
                Text = "User Text"
            }
        };
        var request = new ChatByRecipePostRequestModel
        {
            Id = id,
            Messages = messages
        };
        var responseModels = new[]
        {
            new ChatByRecipeStreamResponse
            {
                Header = new ChatByRecipeStreamHeader
                {
                    Role = ChatByRecipeRole.Assistant
                }
            },
            new ChatByRecipeStreamResponse
            {
                Content = new ChatByRecipeStreamContent
                {
                    Text = "Response"
                }
            },
            new ChatByRecipeStreamResponse
            {
                Content = new ChatByRecipeStreamContent
                {
                    Text = " Text"
                }
            }
        };
        var expectedBody = string.Join("", responseModels
            .Select(model =>
                $"{JsonSerializer.Serialize(
                    model.ToPostStreamResponseModel(),
                    options: _jsonOptionsMock.Object.Value.JsonSerializerOptions
                )}\n"
            ));
        var streamReaderMock = new Mock<IAsyncStreamReader<ChatByRecipeStreamResponse>>();
        streamReaderMock
            .SetupSequence(x => x.MoveNext(It.IsAny<CancellationToken>()))
            .ReturnsAsync(true)
            .ReturnsAsync(true)
            .ReturnsAsync(true)
            .ReturnsAsync(false);
        streamReaderMock
            .SetupSequence(x => x.Current)
            .Returns(responseModels[0])
            .Returns(responseModels[1])
            .Returns(responseModels[2]);

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        _recipeSearchClientMock
            .Setup(x => x.ChatByRecipeStream(
                It.Is<ChatByRecipeRequest>(
                    r => r.Id == id &&
                         r.Username == user.Username &&
                         r.Messages.Count == messages.Length &&
                         r.Messages[0].Role.ToRoleModel() == messages[0].Role &&
                         r.Messages[0].Text == messages[0].Text &&
                         r.Messages[1].Role.ToRoleModel() == messages[1].Role &&
                         r.Messages[1].Text == messages[1].Text
                ),
                null, null, default
            ))
            .Returns(new AsyncServerStreamingCall<ChatByRecipeStreamResponse>(
                streamReaderMock.Object,
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));

        _chatByRecipeController.ControllerContext = new ControllerContext
        {
            HttpContext = new DefaultHttpContext()
        };
        _chatByRecipeController.Response.Body = new MemoryStream();

        // Act
        await _chatByRecipeController.PostStream(request);

        // Assert
        _chatByRecipeController.Response.Headers.ContentType.Should()
            .BeEquivalentTo(new[] { "text/plain" });

        _chatByRecipeController.Response.Body.Seek(0, SeekOrigin.Begin);
        var reader = new StreamReader(_chatByRecipeController.Response.Body);
        var responseBody = await reader.ReadToEndAsync();
        responseBody.Should().BeEquivalentTo(expectedBody);
    }

    [Fact]
    public async void PostStream_WhenUserIsNotAuthenticated_ReturnsUnauthorized()
    {
        // Arrange
        var id = 1;
        var messages = new[]
        {
            new ChatByRecipeMessageModel
            {
                Role = ChatByRecipeRoleModel.Assistant,
                Text = "Assistant Text"
            },
            new ChatByRecipeMessageModel
            {
                Role = ChatByRecipeRoleModel.User,
                Text = "User Text"
            }
        };
        var request = new ChatByRecipePostRequestModel
        {
            Id = id,
            Messages = messages
        };

        _authClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.Unauthorized));

        // Act
        var response = await _chatByRecipeController.PostStream(request);

        // Assert
        response.Should().BeEquivalentTo(new UnauthorizedResult());
    }

    #endregion
}