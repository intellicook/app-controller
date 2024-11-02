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
using RecipeSearchService = IntelliCook.RecipeSearch.Client;

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
                authResponse,
                recipeSearchResponse
            ];
        }
        yield return
        [
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
        IntelliCook.Auth.Contract.Health.HealthGetResponseModel authResponse,
        RecipeSearchService.HealthResponse recipeSearchResponse
    )
    {
        // Arrange
        _authClientMock
            .Setup(m => m.GetHealthAsync())
            .ReturnsAsync(
                IAuthClient
                    .Result<IntelliCook.Auth.Contract.Health.HealthGetResponseModel, IntelliCook.Auth.Contract.Health.HealthGetResponseModel>
                    .FromValue(HttpStatusCode.OK, authResponse)
            );
        _recipeSearchClientMock
            .Setup(m => m.GetHealthAsync(new RecipeSearchService.HealthRequest(), null, null, default))
            .Returns(new AsyncUnaryCall<RecipeSearchService.HealthResponse>(
                Task.FromResult(recipeSearchResponse),
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));

        // Act
        var result = await _healthController.Get();

        // Assert
        var response = result.Should().BeOfType<OkObjectResult>().Which
            .Value.Should().BeAssignableTo<IEnumerable<HealthGetResponseModel>>().Subject;

        response.Should().BeEquivalentTo(new[]
        {
            authResponse.ToHealthGetResponseModel(),
            recipeSearchResponse.ToHealthGetResponseModel()
        });
    }

    public static IEnumerable<object[]> Get_UnhealthyOrDegraded_ReturnsServiceUnavailableObjectResult_TestData()
    {
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
                authResponse,
                recipeSearchResponse
            ];
        }
    }

    [Theory]
    [MemberData(nameof(Get_UnhealthyOrDegraded_ReturnsServiceUnavailableObjectResult_TestData))]
    public async void Get_UnhealthyOrDegraded_ReturnsServiceUnavailableObjectResult(
        IntelliCook.Auth.Contract.Health.HealthGetResponseModel authResponse,
        RecipeSearchService.HealthResponse recipeSearchResponse
    )
    {
        // Arrange
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
            .Setup(m => m.GetHealthAsync(new RecipeSearchService.HealthRequest(), null, null, default))
            .Returns(new AsyncUnaryCall<RecipeSearchService.HealthResponse>(
                Task.FromResult(recipeSearchResponse),
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));

        // Act
        var result = await _healthController.Get();

        // Assert
        var response = result.Should().BeOfType<ObjectResult>().Which
            .Value.Should().BeAssignableTo<IEnumerable<HealthGetResponseModel>>().Subject;

        response.Should().BeEquivalentTo(new[]
        {
            authResponse.ToHealthGetResponseModel(),
            recipeSearchResponse.ToHealthGetResponseModel()
        });
    }

    #endregion
}