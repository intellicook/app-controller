using System.Net;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Diagnostics.HealthChecks;

namespace AppController.Controllers;

[Route("[controller]")]
[ApiController]
[AllowAnonymous]
public class HealthController(HealthCheckService healthCheckService) : ControllerBase
{
    private readonly HealthCheckService _healthCheckService = healthCheckService;

    [HttpGet]
    public async Task<ActionResult> Get()
    {
        var report = await _healthCheckService.CheckHealthAsync();
        var result = new
        {
            status = report.Status.ToString(),
            checks = report.Entries.Select(e => new
            {
                name = e.Key,
                status = e.Value.Status.ToString(),
                description = e.Value.Description?.ToString()
            })
        };
        return report.Status == HealthStatus.Healthy
            ? Ok(result)
            : StatusCode((int)HttpStatusCode.ServiceUnavailable, result);
    }
}
