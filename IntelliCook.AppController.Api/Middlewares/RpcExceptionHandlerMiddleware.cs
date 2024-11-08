using Grpc.Core;
using IntelliCook.AppController.Api.Models;
using System.Text.Json;
using System.Text.RegularExpressions;

namespace IntelliCook.AppController.Api.Middlewares;

public class RpcExceptionHandlerMiddleware(
    ILogger<RpcExceptionHandlerMiddleware> logger,
    RequestDelegate next
)
{
    public async Task InvokeAsync(HttpContext context)
    {
        try
        {
            await next(context);
        }
        catch (RpcException ex)
        {
            logger.LogInformation(ex, "RpcException occurred");
            await HandleRpcException(context, ex);
        }
    }

    private static async Task HandleRpcException(HttpContext context, RpcException ex)
    {
        var statusCode = ex.StatusCode switch
        {
            StatusCode.InvalidArgument => StatusCodes.Status400BadRequest,
            StatusCode.Unauthenticated => StatusCodes.Status401Unauthorized,
            StatusCode.NotFound => StatusCodes.Status404NotFound,
            _ => StatusCodes.Status500InternalServerError,
        };

        context.Response.StatusCode = statusCode;
        context.Response.ContentType = "application/json";

        var problemDetails = new ProblemDetailsModel
        {
            Title = Regex.Replace(ex.StatusCode.ToString(), "(\\B[A-Z])", " $1"),
            Status = statusCode,
            Detail = ex.Status.Detail
        };

        var json = JsonSerializer.Serialize(problemDetails);
        await context.Response.WriteAsync(json);
    }
}