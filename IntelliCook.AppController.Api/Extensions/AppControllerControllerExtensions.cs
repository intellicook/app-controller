using IntelliCook.AppController.Api.Models;
using Microsoft.AspNetCore.Mvc;

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
}