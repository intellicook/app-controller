using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.Health;

public class HealthGetResponseModel
{
    [Required]
    public required HealthServiceModel Service { get; set; }

    [Required]
    public required HealthStatusModel Status { get; set; }

    [Required]
    public required IEnumerable<HealthCheckModel> Checks { get; set; }
}