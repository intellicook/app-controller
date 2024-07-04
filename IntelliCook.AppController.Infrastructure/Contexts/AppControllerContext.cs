using Microsoft.EntityFrameworkCore;

namespace IntelliCook.AppController.Infrastructure.Contexts;

public class AppControllerContext(DbContextOptions<AppControllerContext> options) : DbContext(options);
