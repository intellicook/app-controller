using IntelliCook.AppController.Api.Models;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;

namespace IntelliCook.AppController.Api.Extensions;

public static class AppControllerControllerExtensions
{
    public static ObjectResult Forbidden(this ControllerBase controller, string message)
    {
        return new ObjectResult(new ForbiddenModel { Message = message })
        {
            StatusCode = StatusCodes.Status403Forbidden
        };
    }

    public static async Task Stream(this ControllerBase controller, IAsyncEnumerable<string> stream)
    {
        controller.Response.Headers.ContentType = "text/plain";

        await foreach (var item in stream)
        {
            await controller.Response.WriteAsync(item);
        }
    }

    public static async Task StreamAsJson(
        this ControllerBase controller,
        IAsyncEnumerable<object> stream,
        JsonSerializerOptions? options = null,
        bool newLine = true
    )
    {
        var jsons = stream.Select(item => JsonSerializer.Serialize(item, options: options));
        if (newLine)
        {
            jsons = jsons.Select(json => $"{json}\n");
        }

        await controller.Stream(jsons);
    }
}