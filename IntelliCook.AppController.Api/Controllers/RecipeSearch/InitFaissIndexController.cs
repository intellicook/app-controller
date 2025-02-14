// using IntelliCook.AppController.Api.Extensions;
// using IntelliCook.AppController.Api.Models;
// using IntelliCook.AppController.Api.Models.RecipeSearch.InitFaissIndex;
// using IntelliCook.Auth.Client;
// using IntelliCook.Auth.Contract.User;
// using IntelliCook.RecipeSearch.Client;
// using Microsoft.AspNetCore.Authorization;
// using Microsoft.AspNetCore.Mvc;
//
// namespace IntelliCook.AppController.Api.Controllers.RecipeSearch;
//
// [Tags("RecipeSearch")]
// [Route("RecipeSearch/[controller]")]
// [ApiController]
// [AllowAnonymous]
// public class InitFaissIndexController(
//     IAuthClient authClient,
//     RecipeSearchService.RecipeSearchServiceClient recipeSearchClient
// ) : ControllerBase
// {
//     /// <summary>
//     ///     Initialize Faiss index.
//     /// </summary>
//     /// <remarks>
//     ///     Only admins can initialize Faiss index.
//     ///     This process is asynchronous, you can check the status of the process using the FaissIndexThread endpoint.
//     /// </remarks>
//     [HttpPost]
//     [ProducesResponseType(StatusCodes.Status200OK)]
//     [ProducesResponseType(typeof(ValidationProblemDetailsModel), StatusCodes.Status400BadRequest)]
//     [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
//     [ProducesResponseType(typeof(ForbiddenModel), StatusCodes.Status403Forbidden)]
//     [ProducesResponseType(typeof(ProblemDetailsModel), StatusCodes.Status404NotFound)]
//     public async Task<IActionResult> Post(InitFaissIndexPostRequestModel request)
//     {
//         var userResult = await authClient.GetUserMeAsync();
//         var user = userResult.TryValue;
//
//         if (user is null)
//         {
//             return userResult.ToObjectResult();
//         }
//
//         if (user.Role != UserRoleModel.Admin)
//         {
//             return this.Forbidden("Only admins can initialize Faiss index.");
//         }
//
//         var rpcRequest = new InitFaissIndexRequest();
//
//         if (request.Count.HasValue)
//         {
//             rpcRequest.Count = request.Count.Value;
//         }
//
//         if (!string.IsNullOrWhiteSpace(request.Path))
//         {
//             rpcRequest.Path = request.Path;
//         }
//
//         await recipeSearchClient.InitFaissIndexAsync(rpcRequest);
//         return Ok();
//     }
// }