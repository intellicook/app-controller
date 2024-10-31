# App Controller

The controller service that connects backend components and the frontend.

## Development Setup

The service uses [ASP.NET Core](https://dotnet.microsoft.com/en-us/apps/aspnet) on C# 12 and .NET 8.0. Since I am using JetBrains Rider, I will be able to provide more instructions for setting up the project in Rider.

1. Clone the repository.

2. To open the projects, open the [AppController.sln](AppController.sln) solution file found in the root of the repository.

3. Run the following commands to install the [Husky.Net](https://alirezanet.github.io/Husky.Net/) pre-commit hooks, which can help check if your formatting will pass the GitHub workflows before you commit.

   ```bash
   # Restore the tools defined in .config/dotnet-tools.json
   dotnet tool restore
   
   # Install the Husky.Net git hooks
   dotnet husky install
   ```

## Docker

Apart from running directly on the host machine, you can run it in [Docker](https://www.docker.com) and [Docker Compose](https://docs.docker.com/compose).

Before starting anything, you have to define the environment variables in the `.env` file. You can copy the `.env.example` file and fill in the values.
```bash
cp .env.example .env
```

The only value you need to change is `Build__GithubPat`.

## Making Code Changes

Important things to note when making code changes:

- All code changes made to the main branch must be done from a pull request, the branch name should use `kebab-case`.

- The GitHub workflows on the pull request must be passed before being able to merge into main.

- The formatting are defined in [.editorconfig](./.editorconfig).

- Always use the `dotnet-ef` tool to create migrations and update the database schema, so that the migration files are consistent.

## Tests

The service uses [xUnit](https://xunit.net/) for unit tests and [Moq](https://github.com/devlooped/moq) for mocking. The followings are the test projects:

- [IntelliCook.AppController.Api.UnitTests](IntelliCook.AppController.Api.UnitTests): Unit tests for the API.

- [IntelliCook.AppController.Api.E2ETests](IntelliCook.AppController.Api.E2ETests): End-to-end tests for the API, which runs the in-memory database to test the API from an HTTP client.
