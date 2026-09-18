# Azure 預建環境清單

本文件提供講師課前建置的順序。第一版課程建議只建立一套共用環境，學員不需要 Azure 帳號。

## 必要資源

- 一個課程專用 Resource Group
- Azure Container Registry
- Azure Container Apps Environment
- 一個 Container App
- Container App 的 ingress target port 設定為 8080
- Application Insights 或 Log Analytics
- Azure OpenAI Service 與至少一個模型部署

## GitHub 與 Azure 整合

1. 在 Microsoft Entra ID 建立課程用的應用程式身分。
2. 為指定的 GitHub Repository 與 demo Environment 建立 Federated Credential。
3. 將 Contributor 權限限制在課程 Resource Group。
4. 將 AcrPush 權限授予該身分，範圍限制在課程用 Container Registry。
5. 確認 Container App 的 Managed Identity 可以從 ACR 拉取映像檔。
6. 在 GitHub Environment demo 設定：
   - AZURE_CLIENT_ID
   - AZURE_TENANT_ID
   - AZURE_SUBSCRIPTION_ID
   - AZURE_RESOURCE_GROUP
   - AZURE_CONTAINER_REGISTRY
   - AZURE_CONTAINER_REGISTRY_LOGIN_SERVER
   - AZURE_CONTAINER_APP
   - AZURE_OPENAI_ENDPOINT
   - AZURE_OPENAI_DEPLOYMENT
7. 將 .github/workflow-templates/azure-deploy.yml 複製到 .github/workflows/azure-deploy.yml。
8. 先由講師執行一次 Workflow，再讓學員操作 Pull Request。

## 權限與機密

- 不給學員 Subscription Owner 權限。
- 不將 Azure API Key 放入 Repository、README 或課堂投影片。
- 優先使用 OIDC 與 Entra ID 取得短期權杖。
- 若課程使用 API Key 作為簡化示範，應使用 GitHub Environment Secret，並於課後撤銷或輪替。
- 課後停用 Workflow、刪除或停止課程資源，避免產生非預期費用。

## 建議的預演測試

- 正常 Pull Request 能通過 CI。
- 測試失敗時，CI 能正確阻擋合併。
- Docker Image 能成功建立並推送到 ACR。
- Container App 能更新到最新版本。
- Application Insights 能看到應用程式錯誤。
