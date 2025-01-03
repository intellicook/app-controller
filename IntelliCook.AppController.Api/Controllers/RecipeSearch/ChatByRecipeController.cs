using Grpc.Core;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models;
using IntelliCook.AppController.Api.Models.RecipeSearch.ChatByRecipe;
using IntelliCook.Auth.Client;
using IntelliCook.RecipeSearch.Client;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace IntelliCook.AppController.Api.Controllers.RecipeSearch;

[Tags("RecipeSearch")]
[Route("RecipeSearch/[controller]")]
[ApiController]
[AllowAnonymous]
public class ChatByRecipeController(
    IAuthClient authClient,
    RecipeSearchService.RecipeSearchServiceClient recipeSearchClient,
    IOptions<JsonOptions> jsonOptions
) : ControllerBase
{
    /// <summary>
    ///     Chat about a specific recipe.
    /// </summary>
    [HttpPost]
    [ProducesResponseType(typeof(ChatByRecipePostResponseModel), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(ValidationProblemDetailsModel), StatusCodes.Status400BadRequest)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(typeof(ProblemDetailsModel), StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Post(ChatByRecipePostRequestModel request)
    {
        var userResult = await authClient.GetUserMeAsync();
        var user = userResult.TryValue;

        if (user is null)
        {
            return userResult.ToObjectResult();
        }

        var rpcRequest = new ChatByRecipeRequest();

        rpcRequest.Id = request.Id;
        rpcRequest.Username = user.Username;
        rpcRequest.Name = user.Name;
        rpcRequest.Messages.AddRange(request.Messages.Select(model =>
        {
            var rpcMessage = new ChatByRecipeMessage();

            rpcMessage.Role = model.Role switch
            {
                ChatByRecipeRoleModel.User => ChatByRecipeRole.User,
                ChatByRecipeRoleModel.Assistant => ChatByRecipeRole.Assistant,
                _ => throw new ArgumentOutOfRangeException()
            };
            rpcMessage.Text = model.Text;

            return rpcMessage;
        }));

        var result = await recipeSearchClient.ChatByRecipeAsync(rpcRequest);
        return Ok(result.ToPostResponseModel());
    }

    /// <summary>
    ///     Chat about a specific recipe with streaming response.
    /// </summary>
    [HttpPost]
    [Route("Stream")]
    [Produces("text/plain")]
    [ProducesResponseType(typeof(ChatByRecipePostStreamResponseModel), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(ValidationProblemDetailsModel), StatusCodes.Status400BadRequest)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(typeof(ProblemDetailsModel), StatusCodes.Status404NotFound)]
    public async Task<IActionResult> PostStream(ChatByRecipePostRequestModel request)
    {
        var userResult = await authClient.GetUserMeAsync();
        var user = userResult.TryValue;

        if (user is null)
        {
            return userResult.ToObjectResult();
        }

        var rpcRequest = new ChatByRecipeRequest();

        rpcRequest.Id = request.Id;
        rpcRequest.Username = user.Username;
        rpcRequest.Name = user.Name;
        rpcRequest.Messages.AddRange(request.Messages.Select(model =>
        {
            var rpcMessage = new ChatByRecipeMessage();

            rpcMessage.Role = model.Role switch
            {
                ChatByRecipeRoleModel.User => ChatByRecipeRole.User,
                ChatByRecipeRoleModel.Assistant => ChatByRecipeRole.Assistant,
                _ => throw new ArgumentOutOfRangeException()
            };
            rpcMessage.Text = model.Text;

            return rpcMessage;
        }));

        var result = recipeSearchClient.ChatByRecipeStream(rpcRequest);

        await this.StreamAsJson(
            result.ResponseStream
                .ReadAllAsync()
                .Select(response => response.ToPostStreamResponseModel()),
            options: jsonOptions.Value.JsonSerializerOptions
        );

        return new EmptyResult();
    }
}