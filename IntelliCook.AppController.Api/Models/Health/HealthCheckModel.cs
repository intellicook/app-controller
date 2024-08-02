using System.ComponentModel.DataAnnotations;

namespace IntelliCook.AppController.Api.Models.Health;

public class HealthCheckModel
{
    [Required]
    public required string Name { get; set; }

    [Required]
    public required HealthStatusModel Status { get; set; }
}