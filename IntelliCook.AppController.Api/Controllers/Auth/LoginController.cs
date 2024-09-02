using IntelliCook.AppController.Api.Extensions;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.Auth.Login;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace IntelliCook.AppController.Api.Controllers.Auth;

[Tags("Auth")]
[Route("Auth/[controller]")]
[ApiController]
[AllowAnonymous]
public class LoginController(IAuthClient authClient) : ControllerBase
{
    /// <summary>
    ///     Logs in a user.
    /// </summary>
    [HttpPost]
    [ProducesResponseType(typeof(LoginPostResponseModel), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    public async Task<IActionResult> Post(LoginPostRequestModel request)
    {
        var result = await authClient.PostAuthLoginAsync(request);
        return result.ToObjectResult();
    }
}