using Grpc.Core;
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
public class SelectIngredientController(
    IAuthClient authClient,
    IngredientRecognitionService.IngredientRecognitionServiceClient ingredientRecognitionClient
) : ControllerBase
{
    /// <summary>
    ///     Select ingredient from image.
    /// </summary>
    [HttpPost]
    [ProducesResponseType(typeof(FileContentResult), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(void), StatusCodes.Status400BadRequest)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(typeof(ProblemDetailsModel), StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Post([Required] IFormFile image, [FromForm] SelectIngredientPostRequest request)
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

        var call = ingredientRecognitionClient.SelectIngredientStream();

        var coordsWritten = false;
        var buffer = new byte[4096];
        int bytesRead;

        while ((bytesRead = await stream.ReadAsync(buffer)) > 0)
        {
            var grpcRequest = new SelectIngredientStreamRequest
            {
                Image = Google.Protobuf.ByteString.CopyFrom(buffer, 0, bytesRead)
            };

            if (!coordsWritten)
            {
                grpcRequest.X = request.X;
                grpcRequest.Y = request.Y;
                coordsWritten = true;
            }

            await call.RequestStream.WriteAsync(grpcRequest);
        }

        await call.RequestStream.CompleteAsync();

        string? name = null;
        var chunks = new List<byte[]>();
        await foreach (var response in call.ResponseStream.ReadAllAsync())
        {
            if (response.HasName)
            {
                name = response.Name;
            }

            chunks.Add(response.Image.ToByteArray());
        }

        var imageBytes = chunks.SelectMany(x => x).ToArray();

        return File(imageBytes, "image/jpeg", name);
    }
}