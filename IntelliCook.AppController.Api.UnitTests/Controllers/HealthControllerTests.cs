using FluentAssertions;
using IntelliCook.AppController.Api.Controllers;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.Health;
using IntelliCook.Auth.Client;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using Moq;
using System.Collections;
using System.Net;

namespace IntelliCook.AppController.Api.UnitTests.Controllers;

public class HealthControllerTests
{
    private readonly HealthController _healthController;
    private readonly Mock<IAuthClient> _authClientMock = new();
    private readonly Mock<HealthCheckService> _healthCheckServiceMock = new();

    public HealthControllerTests()
    {
        _healthController = new HealthController(_healthCheckServiceMock.Object, _authClientMock.Object);
    }

    #region Get

    public static IEnumerable<object[]> Get_Healthy_ReturnsOkObjectResult_TestData()
    {
        yield return
        [
            new List<(string name, HealthStatus healthStatus)>
            {
                ("Check 1", HealthStatus.Healthy),
                ("Check 2", HealthStatus.Healthy)
            },
            HealthStatusModel.Healthy,
            new Auth.Contract.Health.HealthGetResponseModel
            {
                Status = Auth.Contract.Health.HealthStatusModel.Healthy,
                Checks = new[]
                {
                    new Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = Auth.Contract.Health.HealthStatusModel.Healthy
                    },
                    new Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 2",
                        Status = Auth.Contract.Health.HealthStatusModel.Healthy
                    }
                }
            }
        ];
        yield return
        [
            new List<(string name, HealthStatus healthStatus)> { ("Check 1", HealthStatus.Healthy) },
            HealthStatusModel.Healthy,
            new Auth.Contract.Health.HealthGetResponseModel
            {
                Status = Auth.Contract.Health.HealthStatusModel.Healthy,
                Checks = new[]
                {
                    new Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = Auth.Contract.Health.HealthStatusModel.Healthy
                    }
                }
            }
        ];
        yield return
        [
            Enumerable.Empty<(string name, HealthStatus healthStatus)>(),
            HealthStatusModel.Healthy,
            new Auth.Contract.Health.HealthGetResponseModel
            {
                Status = Auth.Contract.Health.HealthStatusModel.Healthy,
                Checks = Enumerable.Empty<Auth.Contract.Health.HealthCheckModel>()
            }
        ];
    }

    [Theory]
    [MemberData(nameof(Get_Healthy_ReturnsOkObjectResult_TestData))]
    public async void Get_Healthy_ReturnsOkObjectResult(
        IReadOnlyCollection<(string name, HealthStatus healthStatus)> statuses,
        HealthStatusModel expectedAppControllerStatus,
        Auth.Contract.Health.HealthGetResponseModel authResponse
    )
    {
        // Arrange
        var report = GetHealthReport(statuses);

        _authClientMock
            .Setup(m => m.GetHealthAsync())
            .ReturnsAsync(
                IAuthClient
                    .Result<Auth.Contract.Health.HealthGetResponseModel, Auth.Contract.Health.HealthGetResponseModel>
                    .FromValue(HttpStatusCode.OK, authResponse)
            );
        _healthCheckServiceMock
            .Setup(m => m.CheckHealthAsync(null, new CancellationToken()))
            .ReturnsAsync(report);

        // Act
        var result = await _healthController.Get();

        // Assert
        var response = result.Should().BeOfType<OkObjectResult>().Which
            .Value.Should().BeAssignableTo<IEnumerable<HealthGetResponseModel>>().Subject;

        response.Should().BeEquivalentTo(new[]
        {
            new HealthGetResponseModel
            {
                Service = HealthServiceModel.AppController,
                Status = expectedAppControllerStatus,
                Checks = statuses.Select(s => new HealthCheckModel
                {
                    Name = s.name,
                    Status = s.healthStatus.ToHealthStatusModel()
                })
            },
            authResponse.ToHealthGetResponseModel()
        });
    }

    public static IEnumerable<object[]> Get_UnhealthyOrDegraded_ReturnsServiceUnavailableObjectResult_TestData()
    {
        yield return
        [
            new List<(string name, HealthStatus healthStatus)>
            {
                ("Check 1", HealthStatus.Unhealthy), ("Check 2", HealthStatus.Healthy)
            },
            HealthStatusModel.Unhealthy,
            new Auth.Contract.Health.HealthGetResponseModel
            {
                Status = Auth.Contract.Health.HealthStatusModel.Healthy,
                Checks = new[]
                {
                    new Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = Auth.Contract.Health.HealthStatusModel.Healthy
                    },
                }
            }
        ];
        yield return
        [
            new List<(string name, HealthStatus healthStatus)>
            {
                ("Check 1", HealthStatus.Degraded), ("Check 2", HealthStatus.Healthy)
            },
            HealthStatusModel.Degraded,
            new Auth.Contract.Health.HealthGetResponseModel
            {
                Status = Auth.Contract.Health.HealthStatusModel.Healthy,
                Checks = new[]
                {
                    new Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = Auth.Contract.Health.HealthStatusModel.Healthy
                    },
                }
            }
        ];
        yield return
        [
            new List<(string name, HealthStatus healthStatus)>
            {
                ("Check 1", HealthStatus.Degraded), ("Check 2", HealthStatus.Unhealthy)
            },
            HealthStatusModel.Unhealthy,
            new Auth.Contract.Health.HealthGetResponseModel
            {
                Status = Auth.Contract.Health.HealthStatusModel.Healthy,
                Checks = new[]
                {
                    new Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = Auth.Contract.Health.HealthStatusModel.Healthy
                    },
                }
            }
        ];
        yield return
        [
            new List<(string name, HealthStatus healthStatus)>
            {
                ("Check 1", HealthStatus.Degraded), ("Check 2", HealthStatus.Degraded)
            },
            HealthStatusModel.Degraded,
            new Auth.Contract.Health.HealthGetResponseModel
            {
                Status = Auth.Contract.Health.HealthStatusModel.Healthy,
                Checks = new[]
                {
                    new Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = Auth.Contract.Health.HealthStatusModel.Healthy
                    },
                }
            }
        ];
        yield return
        [
            new List<(string name, HealthStatus healthStatus)>
            {
                ("Check 1", HealthStatus.Unhealthy), ("Check 2", HealthStatus.Unhealthy)
            },
            HealthStatusModel.Unhealthy,
            new Auth.Contract.Health.HealthGetResponseModel
            {
                Status = Auth.Contract.Health.HealthStatusModel.Healthy,
                Checks = new[]
                {
                    new Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = Auth.Contract.Health.HealthStatusModel.Healthy
                    },
                }
            }
        ];
        yield return
        [
            new List<(string name, HealthStatus healthStatus)>
            {
                ("Check 1", HealthStatus.Healthy), ("Check 2", HealthStatus.Healthy)
            },
            HealthStatusModel.Healthy,
            new Auth.Contract.Health.HealthGetResponseModel
            {
                Status = Auth.Contract.Health.HealthStatusModel.Unhealthy,
                Checks = new[]
                {
                    new Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = Auth.Contract.Health.HealthStatusModel.Unhealthy
                    },
                }
            }
        ];
        yield return
        [
            new List<(string name, HealthStatus healthStatus)>
            {
                ("Check 1", HealthStatus.Healthy), ("Check 2", HealthStatus.Healthy)
            },
            HealthStatusModel.Healthy,
            new Auth.Contract.Health.HealthGetResponseModel
            {
                Status = Auth.Contract.Health.HealthStatusModel.Degraded,
                Checks = new[]
                {
                    new Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = Auth.Contract.Health.HealthStatusModel.Degraded
                    },
                }
            }
        ];
    }

    [Theory]
    [MemberData(nameof(Get_UnhealthyOrDegraded_ReturnsServiceUnavailableObjectResult_TestData))]
    public async void Get_UnhealthyOrDegraded_ReturnsServiceUnavailableObjectResult(
        IReadOnlyCollection<(string name, HealthStatus healthStatus)> statuses,
        HealthStatusModel expectedAppControllerStatus,
        Auth.Contract.Health.HealthGetResponseModel authResponse
    )
    {
        // Arrange
        var report = GetHealthReport(statuses);

        _authClientMock
            .Setup(m => m.GetHealthAsync())
            .ReturnsAsync(authResponse.Status switch
            {
                Auth.Contract.Health.HealthStatusModel.Healthy => IAuthClient
                    .Result<Auth.Contract.Health.HealthGetResponseModel, Auth.Contract.Health.HealthGetResponseModel>
                    .FromValue(HttpStatusCode.OK, authResponse),
                _ => IAuthClient
                    .Result<Auth.Contract.Health.HealthGetResponseModel, Auth.Contract.Health.HealthGetResponseModel>
                    .FromError(HttpStatusCode.ServiceUnavailable, authResponse),
            });
        _healthCheckServiceMock
            .Setup(m => m.CheckHealthAsync(null, new CancellationToken()))
            .ReturnsAsync(report);

        // Act
        var result = await _healthController.Get();

        // Assert
        var response = result.Should().BeOfType<ObjectResult>().Which
            .Value.Should().BeAssignableTo<IEnumerable<HealthGetResponseModel>>().Subject;

        response.Should().BeEquivalentTo(new[]
        {
            new HealthGetResponseModel
            {
                Service = HealthServiceModel.AppController,
                Status = expectedAppControllerStatus,
                Checks = statuses.Select(s => new HealthCheckModel
                {
                    Name = s.name,
                    Status = s.healthStatus.ToHealthStatusModel()
                })
            },
            authResponse.ToHealthGetResponseModel()
        });
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