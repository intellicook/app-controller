using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Middlewares;
using IntelliCook.AppController.Api.Options;
using IntelliCook.Auth.Client;
using Microsoft.AspNetCore.Mvc;
using Microsoft.OpenApi.Models;
using System.Reflection;
using System.Text.Json.Serialization;

namespace IntelliCook.AppController.Api;

public class Startup
{
    private IConfiguration Configuration { get; }
    private ApiOptions ApiOptions { get; }
    private AuthOptions AuthOptions { get; }
    private RecipeSearchOptions RecipeSearchOptions { get; }

    public Startup(IConfiguration configuration)
    {
        Configuration = configuration;

        if (Assembly.GetEntryAssembly()?.GetName().Name == "dotnet-swagger")
        {
            Configuration = GetAppSettingsConfiguration();
        }

        ApiOptions = Configuration.GetAppControllerOptions<ApiOptions>();
        AuthOptions = Configuration.GetAppControllerOptions<AuthOptions>();
        RecipeSearchOptions = Configuration.GetAppControllerOptions<RecipeSearchOptions>();
    }

    public void ConfigureServices(IServiceCollection services)
    {
        services.AddAppControllerOptions<ApiOptions>(Configuration);
        services.AddHttpContextAccessor();
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

            o.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
            {
                Name = "Bearer",
                BearerFormat = "JWT",
                Scheme = "bearer",
                Description = "Specify the authorization token.",
                In = ParameterLocation.Header,
                Type = SecuritySchemeType.Http
            });

            o.AddSecurityRequirement(new OpenApiSecurityRequirement
            {
                {
                    new OpenApiSecurityScheme
                    {
                        Reference = new OpenApiReference
                        {
                            Type = ReferenceType.SecurityScheme,
                            Id = "Bearer"
                        }
                    },
                    Array.Empty<string>()
                }
            });

            var xmlFilename = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
            o.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, xmlFilename));
        });

        // Microservice clients
        services.AddAuthClient(AuthOptions);
        services.AddRecipeSearchClient(RecipeSearchOptions);
    }

    public void Configure(WebApplication app)
    {
        // Configure the HTTP request pipeline
        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI(o =>
            {
                o.SwaggerEndpoint($"/swagger/{ApiOptions.VersionString}/swagger.json", ApiOptions.VersionString);
                o.EnablePersistAuthorization();
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
        app.UseMiddleware<RpcExceptionHandlerMiddleware>();
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