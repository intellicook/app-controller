using FluentAssertions;
using Grpc.Core;
using IntelliCook.AppController.Api.E2ETests.Fixtures;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Models.Health;
using IntelliCook.Auth.Client;
using Microsoft.AspNetCore.TestHost;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Diagnostics.HealthChecks;
using Moq;
using System.Net;
using System.Text.Json;
using RecipeSearchService = IntelliCook.RecipeSearch.Client;

namespace IntelliCook.AppController.Api.E2ETests.Endpoints;

[Collection(nameof(ClientFixture))]
public class HealthControllerTests
{
    private const string Path = "/Health";
    private readonly HttpClient _client;
    private readonly ClientFixture _fixture;
    private readonly Mock<HealthCheckService> _healthCheckServiceMock = new();

    public HealthControllerTests(ClientFixture fixture)
    {
        _fixture = fixture;
        _client = fixture.Factory.WithWebHostBuilder(builder =>
        {
            builder.ConfigureTestServices(services =>
            {
                _fixture.ConfigureDefaultTestServices(services);
                services.AddSingleton<HealthCheckService>(_ => _healthCheckServiceMock.Object);
            });
        }).CreateClient();
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
            var recipeSearchResponse = new RecipeSearchService.HealthResponse
            {
                Status = RecipeSearchService.HealthStatus.Healthy,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearchService.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearchService.HealthStatus.Healthy
                },
                new RecipeSearchService.HealthCheck
                {
                    Name = "RecipeSearch check 2",
                    Status = RecipeSearchService.HealthStatus.Healthy
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
            var recipeSearchResponse = new RecipeSearchService.HealthResponse
            {
                Status = RecipeSearchService.HealthStatus.Healthy,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearchService.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearchService.HealthStatus.Healthy
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
            new RecipeSearchService.HealthResponse
            {
                Status = RecipeSearchService.HealthStatus.Healthy,
            }
        ];
    }

    [Theory]
    [MemberData(nameof(Get_Healthy_ReturnsOkObjectResult_TestData))]
    public async void Get_Healthy_ReturnsOkObjectResult(
        IReadOnlyCollection<(string name, HealthStatus healthStatus)> statuses,
        HealthStatusModel expectedAppControllerStatus,
        IntelliCook.Auth.Contract.Health.HealthGetResponseModel authResponse,
        RecipeSearchService.HealthResponse recipeSearchResponse
    )
    {
        // Arrange
        var report = GetHealthReport(statuses);

        _fixture.AuthClientMock
            .Setup(m => m.GetHealthAsync())
            .ReturnsAsync(
                IAuthClient
                    .Result<IntelliCook.Auth.Contract.Health.HealthGetResponseModel,
                        IntelliCook.Auth.Contract.Health.HealthGetResponseModel>
                    .FromValue(HttpStatusCode.OK, authResponse)
            );
        _fixture.RecipeSearchClientMock
            .Setup(m => m.GetHealthAsync(new RecipeSearchService.HealthRequest(), null, null, default))
            .Returns(new AsyncUnaryCall<RecipeSearchService.HealthResponse>(
                Task.FromResult(recipeSearchResponse),
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));
        _healthCheckServiceMock
            .Setup(m => m.CheckHealthAsync(null, It.IsAny<CancellationToken>()))
            .ReturnsAsync(report);

        // Act
        var response = await _client.GetAsync(Path);

        // Assert
        response.EnsureSuccessStatusCode();
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var health = JsonSerializer.Deserialize<List<HealthGetResponseModel>>(content, _fixture.SerializerOptions);
        health.Should().BeEquivalentTo(new[]
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
            var recipeSearchResponse = new RecipeSearchService.HealthResponse
            {
                Status = RecipeSearchService.HealthStatus.Healthy,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearchService.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearchService.HealthStatus.Healthy
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
            var recipeSearchResponse = new RecipeSearchService.HealthResponse
            {
                Status = RecipeSearchService.HealthStatus.Healthy,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearchService.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearchService.HealthStatus.Healthy
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
            var recipeSearchResponse = new RecipeSearchService.HealthResponse
            {
                Status = RecipeSearchService.HealthStatus.Healthy,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearchService.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearchService.HealthStatus.Healthy
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
            var recipeSearchResponse = new RecipeSearchService.HealthResponse
            {
                Status = RecipeSearchService.HealthStatus.Healthy,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearchService.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearchService.HealthStatus.Healthy
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
            var recipeSearchResponse = new RecipeSearchService.HealthResponse
            {
                Status = RecipeSearchService.HealthStatus.Healthy,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearchService.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearchService.HealthStatus.Healthy
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
            var recipeSearchResponse = new RecipeSearchService.HealthResponse
            {
                Status = RecipeSearchService.HealthStatus.Unhealthy,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearchService.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearchService.HealthStatus.Unhealthy
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
            var recipeSearchResponse = new RecipeSearchService.HealthResponse
            {
                Status = RecipeSearchService.HealthStatus.Degraded,
            };
            recipeSearchResponse.Checks.AddRange(new[]
            {
                new RecipeSearchService.HealthCheck
                {
                    Name = "RecipeSearch check 1",
                    Status = RecipeSearchService.HealthStatus.Degraded
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
        RecipeSearchService.HealthResponse recipeSearchResponse
    )
    {
        // Arrange
        var report = GetHealthReport(statuses);

        _fixture.AuthClientMock
            .Setup(m => m.GetHealthAsync())
            .ReturnsAsync(authResponse.Status switch
            {
                IntelliCook.Auth.Contract.Health.HealthStatusModel.Healthy => IAuthClient
                    .Result<IntelliCook.Auth.Contract.Health.HealthGetResponseModel,
                        IntelliCook.Auth.Contract.Health.HealthGetResponseModel>
                    .FromValue(HttpStatusCode.OK, authResponse),
                _ => IAuthClient
                    .Result<IntelliCook.Auth.Contract.Health.HealthGetResponseModel,
                        IntelliCook.Auth.Contract.Health.HealthGetResponseModel>
                    .FromError(HttpStatusCode.ServiceUnavailable, authResponse),
            });
        _fixture.RecipeSearchClientMock
            .Setup(m => m.GetHealthAsync(new RecipeSearchService.HealthRequest(), null, null, default))
            .Returns(new AsyncUnaryCall<RecipeSearchService.HealthResponse>(
                Task.FromResult(recipeSearchResponse),
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));
        _healthCheckServiceMock
            .Setup(m => m.CheckHealthAsync(null, It.IsAny<CancellationToken>()))
            .ReturnsAsync(report);

        // Act
        var response = await _client.GetAsync(Path);

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.ServiceUnavailable);
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var health = JsonSerializer.Deserialize<List<HealthGetResponseModel>>(content, _fixture.SerializerOptions);
        health.Should().BeEquivalentTo(new[]
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