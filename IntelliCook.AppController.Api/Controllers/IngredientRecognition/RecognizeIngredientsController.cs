using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models;
using IntelliCook.AppController.Api.Models.IngredientRecognition;
using IntelliCook.Auth.Client;
using IntelliCook.IngredientRecognition.Client;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Controllers.IngredientRecognition;

[Tags("IngredientRecognition")]
[Route("IngredientRecognition/[controller]")]
[ApiController]
[AllowAnonymous]
public class RecognizeIngredientsController(
    IAuthClient authClient,
    IngredientRecognitionService.IngredientRecognitionServiceClient ingredientRecognitionClient
) : ControllerBase
{
    /// <summary>
    ///     Recognize ingredients from image.
    /// </summary>
    [HttpPost]
    [ProducesResponseType(typeof(RecognizeIngredientsPostResponseModel), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(void), StatusCodes.Status400BadRequest)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(typeof(ProblemDetailsModel), StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Post([Required] IFormFile image)
    {
        if (image.Length == 0)
        {
            return BadRequest();
        }

        var userResult = await authClient.GetUserMeAsync();
        var user = userResult.TryValue;

        if (user is null)
        {
            return userResult.ToObjectResult();
        }

        await using var stream = image.OpenReadStream();

        var call = ingredientRecognitionClient.RecognizeIngredientsStream();

        var buffer = new byte[4096];
        int bytesRead;

        while ((bytesRead = await stream.ReadAsync(buffer)) > 0)
        {
            await call.RequestStream.WriteAsync(new RecognizeIngredientsStreamRequest
            {
                Image = Google.Protobuf.ByteString.CopyFrom(buffer, 0, bytesRead)
            });
        }

        await call.RequestStream.CompleteAsync();

        var response = await call.ResponseAsync;

        return Ok(response.ToPostResponseModel());
    }
}