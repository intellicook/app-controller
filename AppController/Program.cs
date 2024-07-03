using AppController.Contexts;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

var appControllerContextConnectionString = builder.Configuration.GetConnectionString(nameof(AppControllerContext));
if (string.IsNullOrEmpty(appControllerContextConnectionString))
{
    throw new InvalidOperationException($"Could not find a connection string named '{nameof(AppControllerContext)}'");
}

// Add services to the container.

builder.Services.AddDbContext<AppControllerContext>(o => { o.UseSqlServer(appControllerContextConnectionString); });
builder.Services.AddHealthChecks()
    .AddSqlServer(appControllerContextConnectionString)
    .AddDbContextCheck<AppControllerContext>();
builder.Services.AddDatabaseDeveloperPageExceptionFilter();
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
    app.UseDeveloperExceptionPage();
}
else
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
}

using (var scope = app.Services.CreateScope())
{
    var services = scope.ServiceProvider;

    var context = services.GetRequiredService<AppControllerContext>();
    context.Database.EnsureCreated();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
