namespace IntelliCook.AppController.Api.Models.Health;

public class HealthGetResponseModel
{
    public required HealthStatusModel Status { get; set; }
    public required IEnumerable<HealthCheckModel> Checks { get; set; }
}