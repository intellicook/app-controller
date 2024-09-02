using IntelliCook.AppController.Api.Extensions;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.Auth.Register;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ValidationProblemDetails = IntelliCook.AppController.Api.Models.ValidationProblemDetails;

namespace IntelliCook.AppController.Api.Controllers.Auth;

[Tags("Auth")]
[Route("Auth/[controller]")]
[ApiController]
[AllowAnonymous]
public class RegisterController(IAuthClient authClient) : ControllerBase
{
    /// <summary>
    ///     Registers a new user.
    /// </summary>
    [HttpPost]
    [ProducesResponseType(StatusCodes.Status201Created)]
    [ProducesResponseType(typeof(ValidationProblemDetails), StatusCodes.Status400BadRequest)]
    public async Task<IActionResult> Post(RegisterPostRequestModel request)
    {
        var result = await authClient.PostAuthRegisterAsync(request);
        return result.ToObjectResult();
    }
}