# Repository 工作指引

## 目的

本 Repository 是「AI 串接 CI/CD 與 Azure 部署」課程的可重複操作範例。優先維持簡單、可測試、可快速理解的結構。

## 開發規則

- 使用繁體中文及臺灣慣用語撰寫說明；技術名稱、程式碼與指令維持原文。
- 每次功能修改都應補充或更新測試。
- Pull Request 必須先通過 GitHub Actions CI，再進行合併。
- AI 產生的程式碼、測試或審查意見都必須經過人工確認。
- 不在 Repository 中保存 API Key、密碼、Token、Cookie 或私人連線資訊。
- Azure 部署使用 OIDC 或 Managed Identity；不要新增長期共用金鑰。

## 驗證方式

    dotnet test tests/AiCicdAzureLab.Api.Tests/AiCicdAzureLab.Api.Tests.csproj
    docker build -t ai-cicd-azure-lab .

## 變更原則

- 優先進行小幅、容易回復的修改。
- 不要為了示範而新增不必要的 Azure 服務。
- 修改 API 或前端時，同步更新 README.md 與 tests/。
- 任何 Azure 資源名稱、Subscription ID、Endpoint 或帳號資訊都以環境變數或 GitHub Variables 管理。
