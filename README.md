# AI CI/CD Azure Lab

這是一個使用 .NET 8 ASP.NET Core Minimal API 建立的簡單範例，包含：

- C# 後端 API
- HTML、CSS、JavaScript 前端
- Greeting Service 單元測試

前後端由同一個 ASP.NET Core 服務提供。

## 專案結構

```text
src/AiCicdAzureLab.Api/
├─ Program.cs
├─ Services/GreetingService.cs
└─ wwwroot/
   ├─ index.html
   ├─ app.js
   └─ styles.css

tests/AiCicdAzureLab.Api.Tests/
└─ GreetingServiceTests.cs
```

## 本機執行

需求：.NET 8 SDK

在專案根目錄執行：

```powershell
dotnet restore tests/AiCicdAzureLab.Api.Tests/AiCicdAzureLab.Api.Tests.csproj --configfile NuGet.Config
dotnet test tests/AiCicdAzureLab.Api.Tests/AiCicdAzureLab.Api.Tests.csproj --no-restore
dotnet run --project src/AiCicdAzureLab.Api/AiCicdAzureLab.Api.csproj
```

啟動後開啟終端機顯示的網址，或前往：

- `/`：前端頁面
- `/health`：健康檢查
- `/api/greeting?name=小明`：問候 API

## API 範例

```text
GET /health
→ { "status": "ok" }

GET /api/greeting?name=小明
→ { "message": "你好，小明！", ... }
```

按 `Ctrl+C` 可停止服務。
