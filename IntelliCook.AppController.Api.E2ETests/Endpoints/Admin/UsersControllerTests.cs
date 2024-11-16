using FluentAssertions;
using IntelliCook.AppController.Api.E2ETests.Fixtures;
using IntelliCook.Auth.Client;
using IntelliCook.Auth.Contract.User;
using Moq;
using System.Net;
using System.Text.Json;

namespace IntelliCook.AppController.Api.E2ETests.Endpoints.Admin;

[Collection(nameof(ClientFixture))]
public class UsersControllerTests(ClientFixture fixture)
{
    private const string Path = "/Admin/Users";

    #region Get

    [Fact]
    public async void Get_WhenResultIsSuccessful_ReturnsSuccess()
    {
        // Arrange
        var responseModel = new UserGetResponseModel
        {
            Name = "Name",
            Role = UserRoleModel.User,
            Username = "Username",
            Email = "Email@Email.com"
        };
        var responseModels = new[] { responseModel };
        var result = IAuthClient.Result<IEnumerable<UserGetResponseModel>>.FromValue(
            HttpStatusCode.OK, responseModels
        );

        fixture.AuthClientMock
            .Setup(x => x.GetAdminUsersAsync())
            .ReturnsAsync(result);

        fixture.AuthClientMock.Invocations.Clear();

        // Act
        var response = await fixture.Client.GetAsync(Path);

        // Assert
        response.StatusCode.Should().Be(result.StatusCode);
        var content = await response.Content.ReadAsStringAsync();
        content.Should().NotBeNullOrEmpty();

        var error = JsonSerializer.Deserialize<IEnumerable<UserGetResponseModel>>(content, fixture.SerializerOptions);
        error.Should().BeEquivalentTo(result.Value);

        fixture.AuthClientMock.Verify(x => x.GetAdminUsersAsync(), Times.Once);
    }

    [Fact]
    public async void Get_WhenResultHasError_ReturnsError()
    {
        // Arrange
        const HttpStatusCode status = HttpStatusCode.BadRequest;
        var error = new IntelliCook.Auth.Contract.ValidationProblemDetails
        {
            Status = (int)status,
            Detail = "Error"
        };
        var result = IAuthClient.Result<IEnumerable<UserGetResponseModel>>.FromError(
            status, error
        );

        fixture.AuthClientMock
            .Setup(x => x.GetAdminUsersAsync())
            .ReturnsAsync(result);

        fixture.AuthClientMock.Invocations.Clear();

        // Act
        var response = await fixture.Client.GetAsync(Path);

        // Assert
        response.StatusCode.Should().Be(result.StatusCode);

        fixture.AuthClientMock.Verify(x => x.GetAdminUsersAsync(), Times.Once);
    }

    #endregion
}