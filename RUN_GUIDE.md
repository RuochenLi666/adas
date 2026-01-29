# 项目运行指南

## 快速启动

### 方式1：在 VS Code 中运行（最简单）⭐推荐

1. **安装扩展**：
   - 打开 VS Code
   - 进入扩展商店（Ctrl+Shift+X）
   - 搜索 "Spring Boot Extension Pack"
   - 安装官方的 Spring Boot 扩展包

2. **运行项目**：
   - 打开命令面板（Ctrl+Shift+P）
   - 输入 "Spring Boot: Start"
   - 等待项目启动

3. **访问应用**：
   - 打开浏览器访问：`http://localhost:8080/wangshangdangaodian`

### 方式2：命令行运行

#### 前置条件：
- 需要安装 Maven
- 如果未安装，按照以下步骤安装：

**在 Windows 上安装 Maven：**

方案A（使用 Chocolatey，需要管理员权限）：
```
choco install maven
```

方案B（手动安装）：
1. 访问 https://maven.apache.org/download.cgi
2. 下载 "Binary zip archive"（例如：apache-maven-3.9.12-bin.zip）
3. 解压到任意目录（如 C:\maven-3.9.12）
4. 设置环境变量：
   - 新建 `MAVEN_HOME` = `C:\maven-3.9.12`
   - 在 `PATH` 中添加 `%MAVEN_HOME%\bin`
5. 打开新的命令行窗口，验证安装：
   ```
   mvn -v
   ```

#### 编译和运行：

1. **方式A：使用提供的脚本**
   ```bash
   # Windows（进入项目目录后）
   start.bat
   ```

2. **方式B：手动运行命令**
   ```bash
   cd 到项目目录
   mvn clean package
   java -jar target/wangshangdangaodian-0.0.1-SNAPSHOT.jar
   ```

### 方式3：在 IDE 中运行

#### IntelliJ IDEA：
1. 打开项目
2. 右键点击 `wangshangdangaodianApplication.java`
3. 选择 "Run 'wangshangdangaodianApplication.main()'"

#### Eclipse：
1. 右键点击项目 → Run As → Maven build
2. 输入目标：`spring-boot:run`

## 项目访问信息

启动成功后，应用会监听 **8080** 端口

- **前端地址**：`http://localhost:8080/wangshangdangaodian/front/index.html`
- **管理后台**：`http://localhost:8080/wangshangdangaodian/admin/admin/index.html`
- **API 接口**：`http://localhost:8080/wangshangdangaodian/api/*`

## 故障排查

### 问题1：Maven 找不到
**解决**：
- 确保 Maven 已安装且在 PATH 中
- 运行 `mvn -v` 验证
- 重启命令行窗口

### 问题2：端口 8080 已被占用
**解决**：
- 修改 `src/main/resources/application.yml`
- 将 `server.port: 8080` 改为其他端口（如 8081）

### 问题3：数据库连接失败
**解决**：
- 检查网络连接是否正常
- 确认数据库地址和凭证：
  - 地址：`databases.ptcc9.top:3306`
  - 用户名：`wangshangdangaodian`
  - 密码：`123456`
  - 数据库：`wangshangdangaodian`

### 问题4：编译时内存不足
**解决**：
设置 MAVEN_OPTS：
```bash
set MAVEN_OPTS=-Xmx1024m -Xms512m
mvn clean package
```

## 常用命令

```bash
# 清理并编译
mvn clean package

# 只编译不运行
mvn compile

# 跳过测试编译
mvn clean package -DskipTests

# 直接运行 Spring Boot
mvn spring-boot:run

# 生成可执行 JAR
mvn package

# 运行 JAR
java -jar target/wangshangdangaodian-0.0.1-SNAPSHOT.jar

# 指定端口运行
java -jar target/wangshangdangaodian-0.0.1-SNAPSHOT.jar --server.port=8081
```

## 需要帮助？

- 确保 Java 版本 ≥ 1.8
- 项目使用 Spring Boot 2.2.2
- MySQL 数据库连接到远程服务器
- 所有表结构已在 db.sql 中定义
