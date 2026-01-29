@echo off
REM 项目编译和运行一体化脚本
REM 自动下载 Maven（如果未安装）并编译项目

setlocal enabledelayedexpansion

cd /d %~dp0

echo =====================================================
echo  琉糖阁甜品店销售系统 - 项目启动脚本
echo =====================================================
echo.

REM 检查 Java 版本
echo 检查 Java 环境...
java -version >nul 2>&1
if errorlevel 1 (
    echo 错误：未找到 Java 环境，请先安装 JDK 8 或更高版本
    echo 下载地址: https://www.oracle.com/java/technologies/downloads/
    pause
    exit /b 1
)
echo Java 已安装 ✓
echo.

REM 检查 Maven
echo 检查 Maven 环境...
mvn -v >nul 2>&1
if errorlevel 1 (
    echo 未找到 Maven，建议安装方式：
    echo.
    echo 方式1：使用 Chocolatey（推荐）
    echo   choco install maven
    echo.
    echo 方式2：手动下载安装
    echo   1. 访问 https://maven.apache.org/download.cgi
    echo   2. 下载 Binary zip archive
    echo   3. 解压并配置 MAVEN_HOME 环境变量
    echo.
    echo 方式3：使用 IDE 直接运行（推荐）
    echo   在 VS Code 中安装 Spring Boot 扩展
    echo   右键点击 pom.xml，选择"Run Spring Boot App"
    echo.
    pause
    exit /b 1
)
echo Maven 已安装 ✓
echo.

REM 编译项目
echo =====================================================
echo 开始编译项目...
echo =====================================================
echo.

call mvn clean package -DskipTests

if errorlevel 1 (
    echo.
    echo 编译失败！
    pause
    exit /b 1
)

echo.
echo =====================================================
echo 编译成功！
echo =====================================================
echo.
echo 现在启动应用...
echo.

REM 运行 JAR
java -jar target\wangshangdangaodian-0.0.1-SNAPSHOT.jar

pause
