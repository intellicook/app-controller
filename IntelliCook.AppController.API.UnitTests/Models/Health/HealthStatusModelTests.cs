using IntelliCook.AppController.API.Models.Health;
using Microsoft.Extensions.Diagnostics.HealthChecks;

namespace IntelliCook.AppController.API.UnitTests.Models.Health;

public class HealthStatusModelTests
{
    [Theory]
    [InlineData(HealthStatus.Healthy, HealthStatusModel.Healthy)]
    [InlineData(HealthStatus.Degraded, HealthStatusModel.Degraded)]
    [InlineData(HealthStatus.Unhealthy, HealthStatusModel.Unhealthy)]
    public void ToHealthStatusModel_ValidHealthStatus_ReturnsExpectedHealthStatusModel(
        HealthStatus healthStatus,
        HealthStatusModel expectedHealthStatusModel
    )
    {
        var result = healthStatus.ToHealthStatusModel();
        Assert.Equal(expectedHealthStatusModel, result);
    }

    [Fact]
    public void ToHealthStatusModel_InvalidHealthStatus_ThrowsArgumentOutOfRangeException()
    {
        const HealthStatus healthStatus = (HealthStatus)int.MaxValue;
        Assert.Throws<ArgumentOutOfRangeException>(() => healthStatus.ToHealthStatusModel());
    }

    [Theory]
    [InlineData(HealthStatusModel.Healthy, HealthStatus.Healthy)]
    [InlineData(HealthStatusModel.Degraded, HealthStatus.Degraded)]
    [InlineData(HealthStatusModel.Unhealthy, HealthStatus.Unhealthy)]
    public void ToHealthStatus_ValidHealthStatusModel_ReturnsExpectedHealthStatus(
        HealthStatusModel healthStatusModel,
        HealthStatus expectedHealthStatus
    )
    {
        var result = healthStatusModel.ToHealthStatus();
        Assert.Equal(expectedHealthStatus, result);
    }

    [Fact]
    public void ToHealthStatus_InvalidHealthStatusModel_ThrowsArgumentOutOfRangeException()
    {
        const HealthStatusModel healthStatusModel = (HealthStatusModel)int.MaxValue;
        Assert.Throws<ArgumentOutOfRangeException>(() => healthStatusModel.ToHealthStatus());
    }
}