// using FluentAssertions;
// using Grpc.Core;
// using IntelliCook.AppController.Api.E2ETests.Fixtures;
// using IntelliCook.AppController.Api.Extensions;
// using IntelliCook.AppController.Api.Models.RecipeSearch.FaissIndexThread;
// using IntelliCook.Auth.Client;
// using IntelliCook.Auth.Contract.User;
// using IntelliCook.RecipeSearch.Client;
// using Moq;
// using System.Net;
// using System.Text.Json;
//
// namespace IntelliCook.AppController.Api.E2ETests.Endpoints.RecipeSearch;
//
// [Collection(nameof(ClientFixture))]
// public class FaissIndexThreadControllerTests(ClientFixture fixture)
// {
//     private const string Path = "/RecipeSearch/FaissIndexThread";
//
//     #region Get
//
//     [Fact]
//     public async void Get_WhenSuccessful_ReturnsSuccess()
//     {
//         // Arrange
//         var user = new UserGetResponseModel
//         {
//             Name = "Name",
//             Role = UserRoleModel.Admin,
//             Username = "Username",
//             Email = "Email@Example.com"
//         };
//         var responseArgs = new FaissIndexThreadArgs();
//         responseArgs.Count = 1;
//         responseArgs.Model = "Model";
//         responseArgs.Path = "Path";
//         var responseModel = new FaissIndexThreadResponse();
//         responseModel.Status = FaissIndexThreadStatus.Completed;
//         responseModel.Args = responseArgs;
//
//         fixture.AuthClientMock
//             .Setup(x => x.GetUserMeAsync())
//             .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));
//
//         fixture.RecipeSearchClientMock
//             .Setup(x => x.GetFaissIndexThreadAsync(
//                 It.IsAny<FaissIndexThreadRequest>(),
//                 null, null, default
//             ))
//             .Returns(new AsyncUnaryCall<FaissIndexThreadResponse>(
//                 Task.FromResult(responseModel),
//                 Task.FromResult(new Metadata()),
//                 () => Status.DefaultSuccess,
//                 () => new Metadata(),
//                 () => { }
//             ));
//
//         // Act
//         var response = await fixture.Client.GetAsync(Path);
//
//         // Assert
//         response.StatusCode.Should().Be(HttpStatusCode.OK);
//         var content = await response.Content.ReadAsStringAsync();
//         content.Should().NotBeNullOrEmpty();
//
//         var result =
//             JsonSerializer.Deserialize<FaissIndexThreadGetResponseModel>(content, fixture.SerializerOptions);
//         result.Should().BeEquivalentTo(responseModel.ToGetResponseModel());
//     }
//
//     [Fact]
//     public async void Get_WhenUserIsNotAdmin_ReturnsForbidden()
//     {
//         // Arrange
//         var user = new UserGetResponseModel
//         {
//             Name = "Name",
//             Role = UserRoleModel.User,
//             Username = "Username",
//             Email = "Email@Example.com"
//         };
//
//         fixture.AuthClientMock
//             .Setup(x => x.GetUserMeAsync())
//             .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));
//
//         // Act
//         var response = await fixture.Client.GetAsync(Path);
//
//         // Assert
//         response.StatusCode.Should().Be(HttpStatusCode.Forbidden);
//     }
//
//     [Fact]
//     public async void Get_WhenUserIsNotAuthenticated_ReturnsUnauthorized()
//     {
//         // Arrange
//         fixture.AuthClientMock
//             .Setup(x => x.GetUserMeAsync())
//             .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.Unauthorized));
//
//         // Act
//         var response = await fixture.Client.GetAsync(Path);
//
//         // Assert
//         response.StatusCode.Should().Be(HttpStatusCode.Unauthorized);
//     }
//
//     #endregion
// }