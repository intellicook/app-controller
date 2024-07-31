using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Options;
using IntelliCook.AppController.Infrastructure.Contexts;
using Microsoft.AspNetCore.Mvc;
using Microsoft.OpenApi.Models;
using System.Reflection;
using System.Text.Json.Serialization;

namespace IntelliCook.AppController.Api;

public class Startup
{
    private IConfiguration Configuration { get; }
    private ApiOptions ApiOptions { get; }
    private DatabaseOptions DatabaseOptions { get; }

    public Startup(IConfiguration configuration)
    {
        Configuration = configuration;

        if (Assembly.GetEntryAssembly()?.GetName().Name == "dotnet-swagger")
        {
            Configuration = GetAppSettingsConfiguration();
        }

        ApiOptions = Configuration.GetAppControllerOptions<ApiOptions>();
        DatabaseOptions = Configuration.GetAppControllerOptions<DatabaseOptions>();
    }

    public void ConfigureServices(IServiceCollection services)
    {
        services.AddAppControllerOptions<DatabaseOptions>(Configuration);
        services.AddAppControllerOptions<ApiOptions>(Configuration);
        services.AddAppControllerContext(DatabaseOptions);
        services.AddHealthChecks()
            .AddAppControllerHealthChecks(DatabaseOptions);
        services.AddDatabaseDeveloperPageExceptionFilter();
        services.AddControllers(o => o.Filters.Add(new ProducesAttribute("application/json")))
            .AddJsonOptions(o => o.JsonSerializerOptions.Converters.Add(new JsonStringEnumConverter()));
        services.AddEndpointsApiExplorer();
        services.AddSwaggerGen(o =>
        {
            o.SwaggerDoc(ApiOptions.VersionString, new OpenApiInfo
            {
                Version = ApiOptions.VersionString,
                Title = ApiOptions.Title,
                Description = ApiOptions.Description
            });

            var xmlFilename = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
            o.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, xmlFilename));
        });
    }

    public void Configure(WebApplication app, IWebHostEnvironment env)
    {
        // Ensure database is created
        using (var scope = app.Services.CreateScope())
        {
            var services = scope.ServiceProvider;

            var context = services.GetRequiredService<AppControllerContext>();
            context.Database.EnsureCreated();
        }

        // Configure the HTTP request pipeline
        if (env.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI(o =>
            {
                o.SwaggerEndpoint($"/swagger/{ApiOptions.VersionString}/swagger.json", ApiOptions.VersionString);
            });
            app.UseDeveloperExceptionPage();
        }
        else
        {
            app.UseExceptionHandler("/Error");
            app.UseHsts();
        }

        app.UseHttpsRedirection();
        app.UseAuthorization();
        app.MapControllers();
    }

    private static IConfiguration GetAppSettingsConfiguration()
    {
        return new ConfigurationBuilder()
            .SetBasePath(GetProjectRoot())
            .AddJsonFile("appsettings.json")
            .AddEnvironmentVariables()
            .Build();
    }

    private static string GetProjectRoot()
    {
        const string projectName = "IntelliCook.AppController.Api";
        var directory = Directory.GetCurrentDirectory();
        if (directory.Contains(projectName))
        {
            return directory;
        }

        var foundDirectory = Directory.GetDirectories(Directory.GetCurrentDirectory(), projectName);
        if (foundDirectory.Length == 0)
        {
            throw new DirectoryNotFoundException($"Project directory with name {projectName} not found");
        }

        return foundDirectory.First();
    }
}