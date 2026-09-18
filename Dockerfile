FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /src
COPY NuGet.Config ./NuGet.Config
COPY src/AiCicdAzureLab.Api/AiCicdAzureLab.Api.csproj src/AiCicdAzureLab.Api/
RUN dotnet restore src/AiCicdAzureLab.Api/AiCicdAzureLab.Api.csproj \
    --configfile /src/NuGet.Config

COPY src/AiCicdAzureLab.Api/ src/AiCicdAzureLab.Api/
RUN dotnet publish src/AiCicdAzureLab.Api/AiCicdAzureLab.Api.csproj \
    --configuration Release \
    --output /app/publish \
    --no-restore \
    /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime

WORKDIR /app
ENV ASPNETCORE_HTTP_PORTS=8080
EXPOSE 8080

COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "AiCicdAzureLab.Api.dll"]
