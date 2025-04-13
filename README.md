# HTTPS JKS 測試實驗環境

本專案提供一個最小可行的 HTTPS 測試環境，透過自簽憑證產生 `.p12` 及 `.jks`，搭配 Jetty 容器啟動 HTTPS 服務，並可使用 `curl --resolve` 驗證。

---

## 📌 先決條件 (Prerequisites)

在開始前，請確保你的環境已安裝以下工具：

| 工具    | 版本建議      | 用途                              |
|---------|-------------|----------------------------------|
| Docker  | 最新版       | 用來啟動 Jetty HTTPS 測試容器       |
| Java    | 建議 Java 8+ | 執行 `keytool` 建立 `.jks` 憑證    |
| OpenSSL | 建議 1.1+    | 將 `.crt` + `.key` 匯出為 `.p12`  |

可用以下指令確認是否已安裝：

```bash
docker --version
java -version
keytool -help
openssl version
```

---

## 📁 目錄結構

```bash
.
├── 1.generate-jks.sh           # 產生 keystore.p12 → keystore.jks
├── 2.start-jetty.sh            # 啟動 Jetty 容器並掛載 JKS
├── 3.verify-jetty.sh           # 使用 curl --resolve 測試
├── README.md                   # 使用說明（本檔案）
├── ssl/
│   ├── server.crt              # 自簽憑證
│   ├── server.key              # 私鑰
│   ├── keystore.p12            # 中繼 PKCS12 憑證包
│   ├── keystore.jks            # 給 Jetty 用的 JKS
│   ├── jetty-https.xml         # Jetty 的 HTTPS 設定檔
│   └── expired/keystore.jks    # 測試過期憑證用
└── webapps/
    └── index.html              # 測試頁面
```
