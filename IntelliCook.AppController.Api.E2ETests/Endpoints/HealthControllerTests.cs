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
public class HealthControllerTests(ClientFixture fixture)
{
    private const string Path = "/Health";

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
        fixture.AuthClientMock
            .Setup(m => m.GetHealthAsync())
            .ReturnsAsync(
                IAuthClient
                    .Result<IntelliCook.Auth.Contract.Health.HealthGetResponseModel,
                        IntelliCook.Auth.Contract.Health.HealthGetResponseModel>
                    .FromValue(HttpStatusCode.OK, authResponse)
            );
        fixture.RecipeSearchClientMock
            .Setup(m => m.GetHealthAsync(new RecipeSearchService.HealthRequest(), null, null, default))
            .Returns(new AsyncUnaryCall<RecipeSearchService.HealthResponse>(
                Task.FromResult(recipeSearchResponse),
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));

        // Act
        var response = await fixture.Client.GetAsync(Path);

        // Assert
        response.EnsureSuccessStatusCode();
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var health = JsonSerializer.Deserialize<List<HealthGetResponseModel>>(content, fixture.SerializerOptions);
        health.Should().BeEquivalentTo(new[]
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
        fixture.AuthClientMock
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
        fixture.RecipeSearchClientMock
            .Setup(m => m.GetHealthAsync(new RecipeSearchService.HealthRequest(), null, null, default))
            .Returns(new AsyncUnaryCall<RecipeSearchService.HealthResponse>(
                Task.FromResult(recipeSearchResponse),
                Task.FromResult(new Metadata()),
                () => Status.DefaultSuccess,
                () => new Metadata(),
                () => { }
            ));

        // Act
        var response = await fixture.Client.GetAsync(Path);

        // Assert
        response.StatusCode.Should().Be(HttpStatusCode.ServiceUnavailable);
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var health = JsonSerializer.Deserialize<List<HealthGetResponseModel>>(content, fixture.SerializerOptions);
        health.Should().BeEquivalentTo(new[]
        {
            authResponse.ToHealthGetResponseModel(),
            recipeSearchResponse.ToHealthGetResponseModel()
        });
    }

    #endregion
}