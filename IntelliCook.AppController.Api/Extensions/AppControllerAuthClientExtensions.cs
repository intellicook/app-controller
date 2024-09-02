using IntelliCook.Auth.Client;
using Microsoft.AspNetCore.Mvc;

namespace IntelliCook.AppController.Api.Extensions;

public static class AppControllerAuthClientExtensions
{
    public static ObjectResult ToObjectResult<T>(this IAuthClient.Result<T> result) where T : class
    {
        if (result.IsSuccessful)
        {
            return new ObjectResult(result.TryValue)
            {
                StatusCode = (int)result.StatusCode
            };
        }

        if (result.HasValidationError)
        {
            return new ObjectResult(result.TryValidationError)
            {
                StatusCode = (int)result.StatusCode
            };
        }

        return new ObjectResult(result.TryError)
        {
            StatusCode = (int)result.StatusCode
        };
    }
}