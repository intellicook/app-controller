using Microsoft.EntityFrameworkCore;

namespace AppController.Contexts;

public class AppControllerContext(DbContextOptions<AppControllerContext> options) : DbContext(options);
