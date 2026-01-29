# 琉糖閣甜品店銷售系統（wangshangdangaodian）運行說明

## 1. 必備環境

- JDK：**8 或 11**（建議 11）
- IDE：IntelliJ IDEA（任意版本均可）
- 資料庫：MySQL 5.7/8.0（若你使用遠端庫，這一步可略）

## 2. 正確打開專案（最重要）

請務必用 IDEA 打開**本目錄**（也就是包含 `pom.xml` 的這一層）：

- `wangshangdangaodian/`

不要打開外層資料夾，否則 Maven 會出現 `No sources to compile`。

## 3. IDEA 設定（中文介面對照）

1. **File → Open**，選擇 `wangshangdangaodian` 資料夾
2. 右側若出現 Maven 提示，點 **「匯入/載入 Maven」**
3. 設定 JDK：
   - **檔案 → 專案結構 → 專案**
   - Project SDK 選 JDK 8 或 11
4. 若 `target/` 出現干擾，可右鍵 `target`：
   - **將目錄標記為 → 已排除**

## 4. 資料庫設定

專案預設讀取 `src/main/resources/application.yml` 的 MySQL 連線。

### 4.1 使用你自己的本機 MySQL（建議）

1. 建立資料庫（名稱可用 `wangshangdangaodian`）
2. 將專案內 `db.sql` 匯入到資料庫
3. 修改 `src/main/resources/application.yml`：

- `spring.datasource.url`
- `spring.datasource.username`
- `spring.datasource.password`

### 4.2 使用遠端資料庫

如果你本來就能連到 `application.yml` 內的遠端庫，可不改。

## 5. 啟動方式

### 5.1 直接在 IDEA 啟動（推薦）

找到主類：

- `src/main/java/com/wangshangdangaodianApplication.java`

右鍵類名 → **執行**。

啟動成功後預設：

- 服務埠：`8080`
- 專案路徑：`/wangshangdangaodian`

常見入口：

- `http://localhost:8080/wangshangdangaodian/front/index.html`

### 5.2 Maven 打包後啟動

在 IDEA 右側 Maven 面板依序執行：

- `clean`
- `package`

成功後會生成可執行 jar（位於 `target/`），再用命令列：

```bash
java -jar target/wangshangdangaodian-0.0.1-SNAPSHOT.jar
```

## 6. 常見問題

### 6.1 Maven 顯示 `No sources to compile`

幾乎都是「打開的資料夾層級不對」或「沒有把 Maven 專案匯入」。

- 請確認你打開的是 **含 `pom.xml` 的 `wangshangdangaodian/` 這一層**
- 右鍵 `pom.xml` → Maven → **重新匯入**

### 6.2 找不到主類 / ClassNotFoundException

通常是你點到了 `target/generated-*` 下面的生成檔。

- 把 `target/` **標記為已排除**
- 只從 `src/main/java` 下面執行 `wangshangdangaodianApplication`
