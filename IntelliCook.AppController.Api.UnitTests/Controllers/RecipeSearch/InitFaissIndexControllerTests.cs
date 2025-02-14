// using FluentAssertions;
// using Grpc.Core;
// using IntelliCook.AppController.Api.Controllers.RecipeSearch;
// using IntelliCook.AppController.Api.Extensions;
// using IntelliCook.AppController.Api.Models;
// using IntelliCook.AppController.Api.Models.RecipeSearch.InitFaissIndex;
// using IntelliCook.Auth.Client;
// using IntelliCook.Auth.Contract.User;
// using IntelliCook.RecipeSearch.Client;
// using Microsoft.AspNetCore.Mvc;
// using Moq;
// using System.Net;
//
// namespace IntelliCook.AppController.Api.UnitTests.Controllers.RecipeSearch;
//
// public class InitFaissIndexControllerTests
// {
//     private readonly InitFaissIndexController _initFaissIndexController;
//     private readonly Mock<IAuthClient> _authClientMock = new();
//     private readonly Mock<RecipeSearchService.RecipeSearchServiceClient> _recipeSearchClientMock = new();
//
//     public InitFaissIndexControllerTests()
//     {
//         _initFaissIndexController =
//             new InitFaissIndexController(_authClientMock.Object, _recipeSearchClientMock.Object);
//     }
//
//     #region Post
//
//     [Fact]
//     public async void Post_WhenSuccessful_ReturnsSuccess()
//     {
//         // Arrange
//         var user = new UserGetResponseModel
//         {
//             Name = "Name",
//             Role = UserRoleModel.Admin,
//             Username = "Username",
//             Email = "Email@Example.com"
//         };
//         var request = new InitFaissIndexPostRequestModel
//         {
//             Count = 1,
//             Path = "Path"
//         };
//
//         _authClientMock
//             .Setup(x => x.GetUserMeAsync())
//             .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));
//
//         _recipeSearchClientMock
//             .Setup(x => x.InitFaissIndexAsync(
//                 It.Is<InitFaissIndexRequest>(r => r.Count == request.Count && r.Path == request.Path),
//                 null, null, default
//             ))
//             .Returns(new AsyncUnaryCall<InitFaissIndexResponse>(
//                 Task.FromResult(new InitFaissIndexResponse()),
//                 Task.FromResult(new Metadata()),
//                 () => Status.DefaultSuccess,
//                 () => new Metadata(),
//                 () => { }
//             ));
//
//         // Act
//         var response = await _initFaissIndexController.Post(request);
//
//         // Assert
//         response.Should().BeEquivalentTo(new OkResult());
//     }
//
//     [Fact]
//     public async void Post_WhenUserIsNotAdmin_ReturnsForbidden()
//     {
//         // Arrange
//         var user = new UserGetResponseModel
//         {
//             Name = "Name",
//             Role = UserRoleModel.User,
//             Username = "Username",
//             Email = "Email@Example.com"
//         };
//         var request = new InitFaissIndexPostRequestModel
//         {
//             Count = 1,
//             Path = "Path"
//         };
//
//         _authClientMock
//             .Setup(x => x.GetUserMeAsync())
//             .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromValue(HttpStatusCode.OK, user));
//
//         // Act
//         var response = await _initFaissIndexController.Post(request);
//
//         // Assert
//         response.Should()
//             .BeEquivalentTo(_initFaissIndexController.Forbidden("Only admins can initialize Faiss index."));
//     }
//
//     [Fact]
//     public async void Post_WhenUserIsNotAuthenticated_ReturnsUnauthorized()
//     {
//         // Arrange
//         var request = new InitFaissIndexPostRequestModel();
//
//         _authClientMock
//             .Setup(x => x.GetUserMeAsync())
//             .ReturnsAsync(IAuthClient.Result<UserGetResponseModel>.FromError(HttpStatusCode.Unauthorized));
//
//         // Act
//         var response = await _initFaissIndexController.Post(request);
//
//         // Assert
//         response.Should().BeEquivalentTo(new UnauthorizedResult());
//     }
//
//     #endregion
// }