namespace IntelliCook.AppController.Api.Models.Health;

public class HealthCheckModel
{
    public required string Name { get; set; }
    public required HealthStatusModel Status { get; set; }
}