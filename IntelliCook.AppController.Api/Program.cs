using IntelliCook.AppController.Api.Extensions;
using IntelliCook.AppController.Api.Options;
using IntelliCook.AppController.Infrastructure.Contexts;
using Microsoft.AspNetCore.Mvc;
using Microsoft.OpenApi.Models;
using System.Reflection;
using System.Text.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);

// Get options
var databaseOptions = builder.Configuration.GetAppControllerOptions<DatabaseOptions>();
var apiOptions = builder.Configuration.GetAppControllerOptions<ApiOptions>();

// Add services to the container
builder.Services.AddAppControllerOptions<DatabaseOptions>(builder.Configuration);
builder.Services.AddAppControllerOptions<ApiOptions>(builder.Configuration);
builder.Services.AddAppControllerContext(databaseOptions);
builder.Services.AddHealthChecks()
    .AddAppControllerHealthChecks(databaseOptions);
builder.Services.AddDatabaseDeveloperPageExceptionFilter();
builder.Services.AddControllers(o => o.Filters.Add(new ProducesAttribute("application/json")))
    .AddJsonOptions(o => o.JsonSerializerOptions.Converters.Add(new JsonStringEnumConverter()));
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(o =>
{
    o.SwaggerDoc(apiOptions.VersionString, new OpenApiInfo
    {
        Version = apiOptions.VersionString,
        Title = apiOptions.Title,
        Description = apiOptions.Description
    });

    var xmlFilename = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
    o.IncludeXmlComments(Path.Combine(AppContext.BaseDirectory, xmlFilename));
});

var app = builder.Build();

// Ensure database is created
using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;

    var context = services.GetRequiredService<AppControllerContext>();
    context.Database.EnsureCreated();
}

// Configure the HTTP request pipeline
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(o =>
    {
        o.SwaggerEndpoint($"/swagger/{apiOptions.VersionString}/swagger.json", apiOptions.VersionString);
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

app.Run();

public abstract partial class Program
{
}