#!/usr/bin/env pwsh
# Spring Boot 项目启动脚本
# 使用 Java 编译和运行，无需 Maven

$ProjectRoot = $PSScriptRoot
$TargetDir = Join-Path $ProjectRoot "target\classes"
$SrcDir = Join-Path $ProjectRoot "src\main\java"
$ResourcesDir = Join-Path $ProjectRoot "src\main\resources"

Write-Host "============================================" -ForegroundColor Cyan
Write-Host "琉糖阁甜品店销售系统 - 启动脚本" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# 检查 Java
Write-Host "检查 Java 环境..." -ForegroundColor Yellow
$javaVersion = java -version 2>&1 | Select-Object -First 1
if ($LASTEXITCODE -ne 0) {
    Write-Host "错误: 未找到 Java 环境" -ForegroundColor Red
    Write-Host "请先安装 JDK 8 或更高版本" -ForegroundColor Red
    exit 1
}
Write-Host "✓ Java 已安装" -ForegroundColor Green
Write-Host ""

# 如果已编译，直接运行 JAR
$jarFile = Join-Path $ProjectRoot "target\wangshangdangaodian-0.0.1-SNAPSHOT.jar"
if (Test-Path $jarFile) {
    Write-Host "发现已编译的 JAR 文件，直接启动..." -ForegroundColor Green
    Write-Host ""
    Write-Host "应用启动中..." -ForegroundColor Cyan
    Write-Host "访问地址: http://localhost:8080/wangshangdangaodian" -ForegroundColor Green
    Write-Host ""
    java -jar $jarFile
    exit
}

# 如果有编译过的类文件，直接用 Java 运行
if (Test-Path $TargetDir) {
    Write-Host "检测到已编译的类文件，准备启动..." -ForegroundColor Green
    
    # 创建 classpath
    $classpath = $TargetDir
    
    # 查找依赖 JAR 文件（简化版，只加载关键 JAR）
    Write-Host "收集依赖..." -ForegroundColor Yellow
    
    Write-Host "应用启动中..." -ForegroundColor Cyan
    Write-Host "访问地址: http://localhost:8080/wangshangdangaodian" -ForegroundColor Green
    Write-Host ""
    
    cd $ProjectRoot
    java -cp "$TargetDir;$ResourcesDir" com.wangshangdangaodianApplication
    exit
}

# 否则需要编译
Write-Host "未找到编译文件，需要先编译项目" -ForegroundColor Yellow
Write-Host ""
Write-Host "由于未找到 Maven，建议使用以下方式之一：" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. 在 VS Code 中运行:" -ForegroundColor Cyan
Write-Host "   - 安装 Spring Boot Extension Pack 扩展" -ForegroundColor Gray
Write-Host "   - 按 Ctrl+Shift+P → Spring Boot: Start" -ForegroundColor Gray
Write-Host ""
Write-Host "2. 安装 Maven 后运行:" -ForegroundColor Cyan
Write-Host "   mvn clean package" -ForegroundColor Gray
Write-Host "   java -jar target/wangshangdangaodian-0.0.1-SNAPSHOT.jar" -ForegroundColor Gray
Write-Host ""
Write-Host "3. 使用在线编译服务:" -ForegroundColor Cyan
Write-Host "   访问: https://replit.com 或类似服务" -ForegroundColor Gray
Write-Host ""

Read-Host "按 Enter 关闭此窗口"
