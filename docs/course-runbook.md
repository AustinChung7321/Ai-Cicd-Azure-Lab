# 六小時課程操作腳本

## 課前

- 講師完成 GitHub Repository 與 Azure 預建環境。
- 講師先跑通 CI 與一次 Azure 部署。
- 準備一個可以通過的 Pull Request 範例，以及一個測試失敗範例。
- 確認學員只需要 GitHub 帳號；若使用 Codespaces，先確認額度與組織設定。

## 課堂流程

1. 介紹 Git、Pull Request、CI 與 CD 的關係。
2. 學員修改 /api/greeting 的回應內容。
3. 建立 Pull Request，觀察 GitHub Actions 執行測試。
4. 故意讓一個測試失敗，觀察 CI 如何阻擋合併。
5. 介紹 Dockerfile 與 Container Image。
6. 示範 Azure Container Registry 與 Container Apps 的關係。
7. 由講師啟用 Azure 部署 Workflow。
8. 介紹 Azure OpenAI 如何分析 Pull Request 或錯誤日誌。
9. 檢查部署結果與 Application Insights。

## 課程原則

AI 的輸出是建議，不是自動核准。部署前仍要通過測試與人工確認，並避免把個人資料、密碼或憑證送給模型。
