# App Controller

The controller that connects backend components and the frontend.

## Development Setup

The project uses ASP.NET Core on C# 12 and .NET 8.0.

1. Clone the repository

2. If you use an IDE that support solution file, you can find the solution file `AppController.sln` in the root.

3. Run the following commands to install the Husky.Net pre-commit hooks, which can help check if your formatting will pass the CI on GitHub.

   ```bash
   # Restore the tools defined in .config/dotnet-tools.json
   dotnet tool restore
   
   # Install the Husky.Net git hooks
   dotnet husky install
   ```

## Making Code Changes

Important things to note when making code changes:

- All code changes made to the main branch must be done from a pull request.

- The GitHub workflows on the pull request must be passed before being able to merge into main.
  
- The formatting are defined in [.editorconfig](./.editorconfig).
