# AI CI/CD Azure Lab

本版本使用 .NET 8 ASP.NET Core Minimal API 作為後端，使用 HTML、CSS 與原生 JavaScript 作為前端。前後端由同一個 ASP.NET Core 服務提供，因此學員只需要啟動一個服務即可完成示範。

## 課程目標

- 使用 C# 建立簡單的 REST API
- 使用 HTML、CSS 與 JavaScript 呼叫 API

## 應用程式內容

- GET /health：健康檢查
- GET /api/greeting?name=小明：C# API
- /：HTML 與 JavaScript 前端

## 專案結構

    src/AiCicdAzureLab.Api/
    ├─ Services/GreetingService.cs
    ├─ Program.cs
    ├─ AiCicdAzureLab.Api.csproj
    └─ wwwroot/
       ├─ index.html
       ├─ app.js
       └─ styles.css

    tests/AiCicdAzureLab.Api.Tests/
    ├─ AiCicdAzureLab.Api.Tests.csproj
    └─ GreetingServiceTests.cs

    NuGet.Config

## 本機執行

需求：

- .NET 8 SDK
- Windows、macOS 或 Linux

Windows PowerShell：

    dotnet restore tests/AiCicdAzureLab.Api.Tests/AiCicdAzureLab.Api.Tests.csproj --configfile NuGet.Config
    dotnet test tests/AiCicdAzureLab.Api.Tests/AiCicdAzureLab.Api.Tests.csproj --no-restore
    dotnet run --project src/AiCicdAzureLab.Api/AiCicdAzureLab.Api.csproj

啟動後開啟終端機顯示的網址，或使用：

- http://localhost:5000/
- http://localhost:5000/health
- http://localhost:5000/api/greeting?name=小明

實際連接埠可能依 .NET 開發環境設定而不同。

## 使用 Docker 執行

使用前請先安裝並啟動 Docker Desktop，確認 Docker Engine（daemon）正在執行。

    docker build -t ai-cicd-azure-lab .
    docker run --rm -p 8080:8080 ai-cicd-azure-lab

開啟 http://localhost:8080/。

若 Docker 顯示 Windows NuGet fallback package folder 或 ResolvePackageAssets 錯誤，請確認使用目前的 .dockerignore，並重新建置：

    docker build --no-cache -t ai-cicd-azure-lab .

## GitHub Actions

.github/workflows/ci.yml 會在 push 與 pull_request 時自動執行：

1. 設定 .NET 8
2. 還原相依套件
3. 執行 xUnit 測試
4. 建立 Docker Image
