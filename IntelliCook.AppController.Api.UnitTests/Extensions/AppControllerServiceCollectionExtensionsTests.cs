using FluentAssertions;
using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Options;
using IntelliCook.AppController.Infrastructure.Contexts;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Memory;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Moq;

namespace IntelliCook.AppController.Api.UnitTests.Extensions;

public class AppControllerServiceCollectionExtensionsTests
{
    private readonly ServiceCollection _serviceCollection = new();
    private readonly Mock<IConfiguration> _configurationMock = new();

    #region AddAppControllerOptions

    [Fact]
    public void AddAppControllerOptions_ValidConfiguration_ShouldAddOptions()
    {
        // Arrange
        var configurationProvider = new MemoryConfigurationProvider(new MemoryConfigurationSource())
        {
            { "Api:Title", "Test Title" },
            { "Api:Description", "Test Description" },
            { "Api:MajorVersion", "1" },
            { "Api:MinorVersion", "0" }
        };
        _configurationMock
            .Setup(x => x.GetSection(ApiOptions.SectionKey))
            .Returns(new ConfigurationSection(
                new ConfigurationRoot(new IConfigurationProvider[] { configurationProvider }),
                ApiOptions.SectionKey
            ));

        // Act
        _serviceCollection.AddAppControllerOptions<ApiOptions>(_configurationMock.Object);

        // Assert
        var serviceProvider = _serviceCollection.BuildServiceProvider();
        var options = serviceProvider.GetRequiredService<IOptions<ApiOptions>>().Value;
        options.Should().NotBeNull();
    }

    [Fact]
    public void AddAppControllerOptions_MissingProperty_ShouldThrowException()
    {
        // Arrange
        var configurationProvider = new MemoryConfigurationProvider(new MemoryConfigurationSource())
        {
            { "Api:Description", "Test Description" },
            { "Api:MajorVersion", "1" },
            { "Api:MinorVersion", "0" }
        };
        _configurationMock
            .Setup(x => x.GetSection(ApiOptions.SectionKey))
            .Returns(new ConfigurationSection(
                new ConfigurationRoot(new IConfigurationProvider[] { configurationProvider }),
                ApiOptions.SectionKey
            ));

        // Act
        var act = () => _serviceCollection.AddAppControllerOptions<ApiOptions>(_configurationMock.Object);

        // Assert
        var ex = act.Should().Throw<InvalidOperationException>().Which;
        ex.Message.Should().BeEquivalentTo("Title is required");
    }

    [Fact]
    public void AddAppControllerOptions_NotFound_ShouldThrowException()
    {
        // Arrange
        _configurationMock
            .Setup(x => x.GetSection(ApiOptions.SectionKey))
            .Returns(new ConfigurationSection(
                new ConfigurationRoot(Array.Empty<IConfigurationProvider>()),
                ApiOptions.SectionKey
            ));

        // Act
        var act = () => _serviceCollection.AddAppControllerOptions<ApiOptions>(_configurationMock.Object);

        // Assert
        var ex = act.Should().Throw<InvalidOperationException>().Which;
        ex.Message.Should()
            .BeEquivalentTo($"{nameof(ApiOptions)} options section '{ApiOptions.SectionKey}' not found");
    }

    #endregion

    #region AddAppControllerContext

    [Fact]
    public void AddAppControllerContext_InMemory_ShouldAddInMemoryDbContext()
    {
        // Arrange
        var options = new DatabaseOptions
        {
            Name = "Test",
            UseInMemory = true
        };

        // Act
        _serviceCollection.AddAppControllerContext(options);

        // Assert
        var serviceProvider = _serviceCollection.BuildServiceProvider();
        var context = serviceProvider.GetRequiredService<AppControllerContext>();
        context.Database.ProviderName.Should().BeEquivalentTo("Microsoft.EntityFrameworkCore.InMemory");
    }

    [Fact]
    public void AddAppControllerContext_NotInMemory_ShouldAddSqlDbContext()
    {
        // Arrange
        var options = new DatabaseOptions
        {
            Name = "Test",
            UseInMemory = false,
            ConnectionString = "TestConnectionString"
        };

        // Act
        _serviceCollection.AddAppControllerContext(options);

        // Assert
        var serviceProvider = _serviceCollection.BuildServiceProvider();
        var context = serviceProvider.GetRequiredService<AppControllerContext>();
        context.Database.ProviderName.Should().BeEquivalentTo("Microsoft.EntityFrameworkCore.SqlServer");
    }

    #endregion
}