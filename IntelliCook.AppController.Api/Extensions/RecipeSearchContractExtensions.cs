using IntelliCook.AppController.Api.Models.Health;

namespace IntelliCook.AppController.Api.Extensions;

public static class RecipeSearchContractExtensions
{
    public static HealthStatusModel ToHealthStatusModel(this RecipeSearch.Client.HealthStatus model)
    {
        return model switch
        {
            RecipeSearch.Client.HealthStatus.Healthy => HealthStatusModel.Healthy,
            RecipeSearch.Client.HealthStatus.Degraded => HealthStatusModel.Degraded,
            RecipeSearch.Client.HealthStatus.Unhealthy => HealthStatusModel.Unhealthy,
            _ => throw new ArgumentOutOfRangeException(nameof(model), model, null)
        };
    }

    public static HealthCheckModel ToHealthCheckModel(this RecipeSearch.Client.HealthCheck model)
    {
        return new HealthCheckModel
        {
            Name = model.Name,
            Status = model.Status.ToHealthStatusModel()
        };
    }

    public static HealthGetResponseModel ToHealthGetResponseModel(
        this RecipeSearch.Client.HealthResponse model)
    {
        return new HealthGetResponseModel
        {
            Service = HealthServiceModel.RecipeSearch,
            Status = model.Status.ToHealthStatusModel(),
            Checks = model.Checks.Select(ToHealthCheckModel)
        };
    }
}