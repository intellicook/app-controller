using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.Controllers;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.Health;
using IntelliCook.Auth.Client;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using Moq;
using System.Net;
using HealthStatus = Microsoft.Extensions.Diagnostics.HealthChecks.HealthStatus;
using RecipeSearchClient = IntelliCook.RecipeSearch.Client.RecipeSearchService.RecipeSearchServiceClient;

namespace IntelliCook.AppController.Api.UnitTests.Controllers;

public class HealthControllerTests
{
    private readonly HealthController _healthController;
    private readonly Mock<IAuthClient> _authClientMock = new();
    private readonly Mock<RecipeSearchClient> _recipeSearchClientMock = new();
    private readonly Mock<HealthCheckService> _healthCheckServiceMock = new();

    public HealthControllerTests()
    {
        _healthController = new HealthController(
            _healthCheckServiceMock.Object,
            _authClientMock.Object,
            _recipeSearchClientMock.Object
        );
    }

    #region Get

    public static IEnumerable<object[]> Get_Healthy_ReturnsOkObjectResult_TestData()
    {
        {
            var authResponse = new IntelliCook.Auth.Contract.Health.HealthGetResponseModel
            {
                Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy,
                Checks = new[]
                {
                    new IntelliCook.Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy
                    },
                    new IntelliCook.Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 2",
                        Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy
                    }
                }
            };
            var recipeSearchResponse = new RecipeSearch.Client.HealthResponse
            {
                Status = RecipeSearch.Client.HealthStatus.Healthy,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearch.Client.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearch.Client.HealthStatus.Healthy
                },
                new RecipeSearch.Client.HealthCheck
                {
                    Name = "RecipeSearch check 2",
                    Status = RecipeSearch.Client.HealthStatus.Healthy
                }
            });
            yield return
            [
                new List<(string name, HealthStatus healthStatus)>
                {
                    ("Check 1", HealthStatus.Healthy),
                    ("Check 2", HealthStatus.Healthy)
                },
                HealthStatusModel.Healthy,
                authResponse,
                recipeSearchResponse
            ];
        }
        {
            var authResponse = new IntelliCook.Auth.Contract.Health.HealthGetResponseModel
            {
                Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy,
                Checks = new[]
                {
                    new IntelliCook.Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy
                    }
                }
            };
            var recipeSearchResponse = new RecipeSearch.Client.HealthResponse
            {
                Status = RecipeSearch.Client.HealthStatus.Healthy,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearch.Client.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearch.Client.HealthStatus.Healthy
                }
            });
            yield return
            [
                new List<(string name, HealthStatus healthStatus)> { ("Check 1", HealthStatus.Healthy) },
                HealthStatusModel.Healthy,
                authResponse,
                recipeSearchResponse
            ];
        }
        yield return
        [
            Enumerable.Empty<(string name, HealthStatus healthStatus)>(),
            HealthStatusModel.Healthy,
            new IntelliCook.Auth.Contract.Health.HealthGetResponseModel
            {
                Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy,
                Checks = Enumerable.Empty<IntelliCook.Auth.Contract.Health.HealthCheckModel>()
            },
            new RecipeSearch.Client.HealthResponse
            {
                Status = RecipeSearch.Client.HealthStatus.Healthy,
            }
        ];
    }

    [Theory]
    [MemberData(nameof(Get_Healthy_ReturnsOkObjectResult_TestData))]
    public async void Get_Healthy_ReturnsOkObjectResult(
        IReadOnlyCollection<(string name, HealthStatus healthStatus)> statuses,
        HealthStatusModel expectedAppControllerStatus,
        IntelliCook.Auth.Contract.Health.HealthGetResponseModel authResponse,
        RecipeSearch.Client.HealthResponse recipeSearchResponse
    )
    {
        // Arrange
        var report = GetHealthReport(statuses);

        _authClientMock
            .Setup(m => m.GetHealthAsync())
            .ReturnsAsync(
                IAuthClient
                    .Result<IntelliCook.Auth.Contract.Health.HealthGetResponseModel, IntelliCook.Auth.Contract.Health.HealthGetResponseModel>
                    .FromValue(HttpStatusCode.OK, authResponse)
            );
        _recipeSearchClientMock
            .Setup(m => m.GetHealthAsync(new RecipeSearch.Client.HealthRequest(), null, null, default))
            .Returns(new AsyncUnaryCall<RecipeSearch.Client.HealthResponse>(
                Task.FromResult(recipeSearchResponse),
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));
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
            authResponse.ToHealthGetResponseModel(),
            recipeSearchResponse.ToHealthGetResponseModel()
        });
    }

    public static IEnumerable<object[]> Get_UnhealthyOrDegraded_ReturnsServiceUnavailableObjectResult_TestData()
    {
        {
            var authResponse = new IntelliCook.Auth.Contract.Health.HealthGetResponseModel
            {
                Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy,
                Checks = new[]
                {
                    new IntelliCook.Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy
                    },
                }
            };
            var recipeSearchResponse = new RecipeSearch.Client.HealthResponse
            {
                Status = RecipeSearch.Client.HealthStatus.Healthy,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearch.Client.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearch.Client.HealthStatus.Healthy
                }
            });
            yield return
            [
                new List<(string name, HealthStatus healthStatus)>
                {
                    ("Check 1", HealthStatus.Unhealthy), ("Check 2", HealthStatus.Healthy)
                },
                HealthStatusModel.Unhealthy,
                authResponse,
                recipeSearchResponse
            ];
        }
        {
            var authResponse = new IntelliCook.Auth.Contract.Health.HealthGetResponseModel
            {
                Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy,
                Checks = new[]
                {
                    new IntelliCook.Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy
                    },
                }
            };
            var recipeSearchResponse = new RecipeSearch.Client.HealthResponse
            {
                Status = RecipeSearch.Client.HealthStatus.Healthy,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearch.Client.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearch.Client.HealthStatus.Healthy
                }
            });
            yield return
            [
                new List<(string name, HealthStatus healthStatus)>
                {
                    ("Check 1", HealthStatus.Degraded), ("Check 2", HealthStatus.Healthy)
                },
                HealthStatusModel.Degraded,
                authResponse,
                recipeSearchResponse
            ];
        }
        {
            var authResponse = new IntelliCook.Auth.Contract.Health.HealthGetResponseModel
            {
                Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy,
                Checks = new[]
                {
                    new IntelliCook.Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy
                    },
                }
            };
            var recipeSearchResponse = new RecipeSearch.Client.HealthResponse
            {
                Status = RecipeSearch.Client.HealthStatus.Healthy,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearch.Client.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearch.Client.HealthStatus.Healthy
                }
            });
            yield return
            [
                new List<(string name, HealthStatus healthStatus)>
                {
                    ("Check 1", HealthStatus.Degraded), ("Check 2", HealthStatus.Unhealthy)
                },
                HealthStatusModel.Unhealthy,
                authResponse,
                recipeSearchResponse
            ];
        }
        {
            var authResponse = new IntelliCook.Auth.Contract.Health.HealthGetResponseModel
            {
                Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy,
                Checks = new[]
                {
                    new IntelliCook.Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy
                    },
                }
            };
            var recipeSearchResponse = new RecipeSearch.Client.HealthResponse
            {
                Status = RecipeSearch.Client.HealthStatus.Healthy,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearch.Client.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearch.Client.HealthStatus.Healthy
                }
            });
            yield return
            [
                new List<(string name, HealthStatus healthStatus)>
                {
                    ("Check 1", HealthStatus.Degraded), ("Check 2", HealthStatus.Degraded)
                },
                HealthStatusModel.Degraded,
                authResponse,
                recipeSearchResponse
            ];
        }
        {
            var authResponse = new IntelliCook.Auth.Contract.Health.HealthGetResponseModel
            {
                Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy,
                Checks = new[]
                {
                    new IntelliCook.Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy
                    },
                }
            };
            var recipeSearchResponse = new RecipeSearch.Client.HealthResponse
            {
                Status = RecipeSearch.Client.HealthStatus.Healthy,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearch.Client.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearch.Client.HealthStatus.Healthy
                }
            });
            yield return
            [
                new List<(string name, HealthStatus healthStatus)>
                {
                    ("Check 1", HealthStatus.Unhealthy), ("Check 2", HealthStatus.Unhealthy)
                },
                HealthStatusModel.Unhealthy,
                authResponse,
                recipeSearchResponse
            ];
        }
        {
            var authResponse = new IntelliCook.Auth.Contract.Health.HealthGetResponseModel
            {
                Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Unhealthy,
                Checks = new[]
                {
                    new IntelliCook.Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Unhealthy
                    },
                }
            };
            var recipeSearchResponse = new RecipeSearch.Client.HealthResponse
            {
                Status = RecipeSearch.Client.HealthStatus.Unhealthy,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearch.Client.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearch.Client.HealthStatus.Unhealthy
                }
            });
            yield return
            [
                new List<(string name, HealthStatus healthStatus)>
                {
                    ("Check 1", HealthStatus.Healthy), ("Check 2", HealthStatus.Healthy)
                },
                HealthStatusModel.Healthy,
                authResponse,
                recipeSearchResponse
            ];
        }
        {
            var authResponse = new IntelliCook.Auth.Contract.Health.HealthGetResponseModel
            {
                Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Degraded,
                Checks = new[]
                {
                    new IntelliCook.Auth.Contract.Health.HealthCheckModel
                    {
                        Name = "Auth check 1",
                        Status = IntelliCook.Auth.Contract.Health.HealthStatusModel.Degraded
                    },
                }
            };
            var recipeSearchResponse = new RecipeSearch.Client.HealthResponse
            {
                Status = RecipeSearch.Client.HealthStatus.Degraded,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearch.Client.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearch.Client.HealthStatus.Degraded
                }
            });
            yield return
            [
                new List<(string name, HealthStatus healthStatus)>
                {
                    ("Check 1", HealthStatus.Healthy), ("Check 2", HealthStatus.Healthy)
                },
                HealthStatusModel.Healthy,
                authResponse,
                recipeSearchResponse
            ];
        }
    }

    [Theory]
    [MemberData(nameof(Get_UnhealthyOrDegraded_ReturnsServiceUnavailableObjectResult_TestData))]
    public async void Get_UnhealthyOrDegraded_ReturnsServiceUnavailableObjectResult(
        IReadOnlyCollection<(string name, HealthStatus healthStatus)> statuses,
        HealthStatusModel expectedAppControllerStatus,
        IntelliCook.Auth.Contract.Health.HealthGetResponseModel authResponse,
        RecipeSearch.Client.HealthResponse recipeSearchResponse
    )
    {
        // Arrange
        var report = GetHealthReport(statuses);

        _authClientMock
            .Setup(m => m.GetHealthAsync())
            .ReturnsAsync(authResponse.Status switch
            {
                IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy => IAuthClient
                    .Result<IntelliCook.Auth.Contract.Health.HealthGetResponseModel, IntelliCook.Auth.Contract.Health.HealthGetResponseModel>
                    .FromValue(HttpStatusCode.OK, authResponse),
                _ => IAuthClient
                    .Result<IntelliCook.Auth.Contract.Health.HealthGetResponseModel, IntelliCook.Auth.Contract.Health.HealthGetResponseModel>
                    .FromError(HttpStatusCode.ServiceUnavailable, authResponse),
            });
        _recipeSearchClientMock
            .Setup(m => m.GetHealthAsync(new RecipeSearch.Client.HealthRequest(), null, null, default))
            .Returns(new AsyncUnaryCall<RecipeSearch.Client.HealthResponse>(
                Task.FromResult(recipeSearchResponse),
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));
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
            authResponse.ToHealthGetResponseModel(),
            recipeSearchResponse.ToHealthGetResponseModel()
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