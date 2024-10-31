FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
ARG GITHUB_PAT
WORKDIR /src
COPY "nuget.config" .
COPY ["IntelliCook.AppController.Api/IntelliCook.AppController.Api.csproj", "IntelliCook.AppController.Api/"]
RUN dotnet nuget update source "intellicook-github" \
    --source "https://nuget.pkg.github.com/intellicook/index.json" \
    --username "username@users.noreply.github.com" \
    --password $GITHUB_PAT \
    --store-password-in-clear-text
RUN dotnet restore "IntelliCook.AppController.Api/IntelliCook.AppController.Api.csproj"
COPY . .
WORKDIR "/src/IntelliCook.AppController.Api"
RUN dotnet build "IntelliCook.AppController.Api.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "IntelliCook.AppController.Api.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "IntelliCook.AppController.Api.dll"]
