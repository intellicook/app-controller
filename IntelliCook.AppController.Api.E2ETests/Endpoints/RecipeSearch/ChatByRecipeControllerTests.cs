using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.E2ETests.Fixtures;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.RecipeSearch.ChatByRecipe;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using IntelliCook.RecipeSearch.Client;
using Moq;
using System.Net;
using System.Net.Http.Json;
using System.Text.Json;

namespace IntelliCook.AppController.Api.E2ETests.Endpoints.RecipeSearch;

[Collection(nameof(ClientFixture))]
public class ChatByRecipeControllerTests(ClientFixture fixture)
{
    private const string Path = "/RecipeSearch/ChatByRecipe";

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
        var request = new ChatByRecipePostRequestModel
        {
            Id = 1,
            Messages = new[]
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
                },
            }
        };
        var responseModel = new ChatByRecipeResponse();
        responseModel.Message = new ChatByRecipeMessage
        {
            Role = ChatByRecipeRole.Assistant,
            Text = "Assistant Response Text"
        };

        fixture.AuthClientMock
            .Setup(x => x.GetUserMeAsync())
            .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));

        fixture.RecipeSearchClientMock
            .Setup(x => x.ChatByRecipeAsync(
                It.Is<ChatByRecipeRequest>(r =>
                    r.Id == request.Id &&
                    r.Username == user.Username &&
                    r.Name == user.Name &&
                    r.Messages.Count == request.Messages.Count() &&
                    r.Messages[0].Role.ToRoleModel() == request.Messages.First().Role &&
                    r.Messages[0].Text == request.Messages.First().Text &&
                    r.Messages[1].Role.ToRoleModel() == request.Messages.Take(2).Last().Role &&
                    r.Messages[1].Text == request.Messages.Take(2).Last().Text
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
        var response =
            await fixture.Client.PostAsync(Path, JsonContent.Create(request, options: fixture.SerializerOptions));

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.OK);
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var result =
            JsonSerializer.Deserialize<ChatByRecipePostResponseModel>(content, fixture.SerializerOptions);
        result.Should().BeEquivalentTo(responseModel.ToPostResponseModel());
    }

    [Fact]
    public async void Post_WhenUserIsNotAuthenticated_ReturnsUnauthorized()
    {
        // Arrange
        var request = new ChatByRecipePostRequestModel
        {
            Id = 1,
            Messages = new[]
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
                },
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