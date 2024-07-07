using FluentAssertions;
using IntelliCook.AppController.Api.E2ETests.Fixtures;
using IntelliCook.AppController.Api.Models.Health;
using IntelliCook.AppController.Infrastructure.Contexts;
using Microsoft.AspNetCore.TestHost;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using Moq;
using System.Net;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace IntelliCook.AppController.Api.E2ETests.Endpoints;

[Collection(nameof(ClientFixture))]
public class HealthControllerTests
{
    private const string Path = "/health";
    private readonly HttpClient _client;
    private readonly Mock<HealthCheckService> _healthCheckServiceMock = new();

    public HealthControllerTests(ClientFixture fixture)
    {
        _client = fixture.Factory.WithWebHostBuilder(builder =>
        {
            builder.ConfigureTestServices(services =>
            {
                services.AddSingleton<HealthCheckService>(_ => _healthCheckServiceMock.Object);
            });
        }).CreateClient();
    }

    #region Get

    public static IEnumerable<object[]> Get_Healthy_ReturnsOkObjectResult_TestData()
    {
        yield return
        [
            new List<(string name, HealthStatus healthStatus)>
            {
                ("Check1", HealthStatus.Healthy),
                ("Check2", HealthStatus.Healthy)
            },
            HealthStatusModel.Healthy
        ];
        yield return
        [
            new List<(string name, HealthStatus healthStatus)> { ("Check1", HealthStatus.Healthy) },
            HealthStatusModel.Healthy
        ];
        yield return
        [
            Enumerable.Empty<(string name, HealthStatus healthStatus)>(),
            HealthStatusModel.Healthy
        ];
    }

    [Theory]
    [MemberData(nameof(Get_Healthy_ReturnsOkObjectResult_TestData))]
    public async void Get_Healthy_ReturnsOkObjectResult(
        IReadOnlyCollection<(string name, HealthStatus healthStatus)> statuses,
        HealthStatusModel expectedStatus
    )
    {
        // Arrange
        var report = GetHealthReport(statuses);

        _healthCheckServiceMock
            .Setup(m => m.CheckHealthAsync(null, It.IsAny<CancellationToken>()))
            .ReturnsAsync(report);

        // Act
        var response = await _client.GetAsync(Path);

        // Assert
        response.EnsureSuccessStatusCode();
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var health = JsonSerializer.Deserialize<HealthGetResponseModel>(content, new JsonSerializerOptions
        {
            PropertyNameCaseInsensitive = true,
            Converters = { new JsonStringEnumConverter() }
        });
        health.Should().NotBeNull();
        health!.Status.Should().Be(expectedStatus);
        health.Checks.Should().BeEquivalentTo(statuses.Select(s => new HealthCheckModel
        {
            Name = s.name,
            Status = s.healthStatus.ToHealthStatusModel()
        }));
    }

    public static IEnumerable<object[]> Get_UnhealthyOrDegraded_ReturnsServiceUnavailableObjectResult_TestData()
    {
        yield return
        [
            new List<(string name, HealthStatus healthStatus)>
            {
                ("Check1", HealthStatus.Unhealthy), ("Check2", HealthStatus.Healthy)
            },
            HealthStatusModel.Unhealthy
        ];
        yield return
        [
            new List<(string name, HealthStatus healthStatus)>
            {
                ("Check1", HealthStatus.Degraded), ("Check2", HealthStatus.Healthy)
            },
            HealthStatusModel.Degraded
        ];
        yield return
        [
            new List<(string name, HealthStatus healthStatus)>
            {
                ("Check1", HealthStatus.Degraded), ("Check2", HealthStatus.Unhealthy)
            },
            HealthStatusModel.Unhealthy
        ];
        yield return
        [
            new List<(string name, HealthStatus healthStatus)>
            {
                ("Check1", HealthStatus.Degraded), ("Check2", HealthStatus.Degraded)
            },
            HealthStatusModel.Degraded
        ];
        yield return
        [
            new List<(string name, HealthStatus healthStatus)>
            {
                ("Check1", HealthStatus.Unhealthy), ("Check2", HealthStatus.Unhealthy)
            },
            HealthStatusModel.Unhealthy
        ];
    }


    [Theory]
    [MemberData(nameof(Get_UnhealthyOrDegraded_ReturnsServiceUnavailableObjectResult_TestData))]
    public async void Get_UnhealthyOrDegraded_ReturnsServiceUnavailableObjectResult(
        IReadOnlyCollection<(string name, HealthStatus healthStatus)> statuses,
        HealthStatusModel expectedStatus
    )
    {
        // Arrange
        var report = GetHealthReport(statuses);

        _healthCheckServiceMock
            .Setup(m => m.CheckHealthAsync(null, It.IsAny<CancellationToken>()))
            .ReturnsAsync(report);

        // Act
        var response = await _client.GetAsync(Path);

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.ServiceUnavailable);
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var health = JsonSerializer.Deserialize<HealthGetResponseModel>(content, new JsonSerializerOptions
        {
            PropertyNameCaseInsensitive = true,
            Converters = { new JsonStringEnumConverter() }
        });
        health.Should().NotBeNull();
        health!.Status.Should().Be(expectedStatus);
        health.Checks.Should().BeEquivalentTo(statuses.Select(s => new HealthCheckModel
        {
            Name = s.name,
            Status = s.healthStatus.ToHealthStatusModel()
        }));
    }

    #endregion

    private static HealthReport GetHealthReport(IReadOnlyCollection<(string name, HealthStatus healthStatus)> statuses)
    {
        return new HealthReport(
            statuses.ToDictionary(
                s => s.name,
                s => new HealthReportEntry(
                    s.healthStatus,
                    null,
                    TimeSpan.FromMilliseconds(1),
                    null,
                    null
                )
            ),
            TimeSpan.FromMilliseconds(3)
        );
    }
}