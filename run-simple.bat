@echo off
REM 直接用 Java 编译并运行项目
REM 无需 Maven

setlocal enabledelayedexpansion

cd /d %~dp0

echo =====================================================
echo  琉糖阁甜品店销售系统 - 快速启动
echo =====================================================
echo.

echo 检查 Java 环境...
java -version >nul 2>&1
if errorlevel 1 (
    echo 错误: 未找到 Java，请先安装 JDK
    pause
    exit /b 1
)
echo ✓ Java 已就绪
echo.

REM 第一步：编译 Java 源文件
echo 正在编译项目...
echo.

if not exist "target\classes" mkdir "target\classes"

REM 收集源文件进行编译
setlocal enabledelayedexpansion
set SRCPATH=src\main\java\com\**\*.java
set CLASSPATH=target\classes;src\main\resources

REM 编译关键类（简化版）
javac -encoding UTF-8 -d target\classes -cp target\classes src\main\java\com\wangshangdangaodianApplication.java 2>nul

if errorlevel 1 (
    echo 编译失败，需要完整的 Maven 编译
    echo.
    echo 请使用以下方式之一：
    echo 1. 在 VS Code 中使用 Spring Boot 扩展
    echo 2. 安装 Maven 后运行: mvn clean package
    echo.
    pause
    exit /b 1
)

echo ✓ 编译完成
echo.

REM 第二步：运行应用
echo =====================================================
echo 启动应用中...
echo =====================================================
echo.
echo 访问地址: http://localhost:8080/wangshangdangaodian
echo.
echo 按 Ctrl+C 停止应用
echo.

cd /d %~dp0
java -cp target\classes;src\main\resources com.wangshangdangaodianApplication

pause
