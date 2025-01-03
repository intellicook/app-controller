using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace IntelliCook.AppController.Api.Controllers.User;

[Tags("User")]
[Route("User/[controller]")]
[ApiController]
[AllowAnonymous]
public class MeController(IAuthClient authClient) : ControllerBase
{
    /// <summary>
    ///     Gets the current user.
    /// </summary>
    [HttpGet]
    [ProducesResponseType(typeof(UserGetResponseModel), StatusCodes.Status200OK)]
    [ProducesResponseType(typeof(ValidationProblemDetailsModel), StatusCodes.Status400BadRequest)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(typeof(ProblemDetailsModel), StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Get()
    {
        var result = await authClient.GetUserMeAsync();
        return result.ToObjectResult();
    }

    /// <summary>
    ///     Updates the current user.
    /// </summary>
    [HttpPut]
    [ProducesResponseType(typeof(UserPutResponseModel), StatusCodes.Status204NoContent)]
    [ProducesResponseType(typeof(ValidationProblemDetailsModel), StatusCodes.Status400BadRequest)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(typeof(ProblemDetailsModel), StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Put(UserPutRequestModel request)
    {
        var result = await authClient.PutUserMeAsync(request);
        return result.ToObjectResult();
    }

    /// <summary>
    ///     Updates the current user's password.
    /// </summary>
    [Route("Password")]
    [HttpPut]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(typeof(ValidationProblemDetailsModel), StatusCodes.Status400BadRequest)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(typeof(ProblemDetailsModel), StatusCodes.Status404NotFound)]
    public async Task<IActionResult> PutPassword(UserPasswordPutRequestModel request)
    {
        var result = await authClient.PutUserMePasswordAsync(request);
        return result.ToObjectResult();
    }

    /// <summary>
    ///     Deletes the current user.
    /// </summary>
    [HttpDelete]
    [ProducesResponseType(StatusCodes.Status204NoContent)]
    [ProducesResponseType(typeof(ValidationProblemDetailsModel), StatusCodes.Status400BadRequest)]
    [ProducesResponseType(typeof(void), StatusCodes.Status401Unauthorized)]
    [ProducesResponseType(typeof(ProblemDetailsModel), StatusCodes.Status404NotFound)]
    public async Task<IActionResult> Delete()
    {
        var result = await authClient.DeleteUserMeAsync();
        return result.ToObjectResult();
    }
}