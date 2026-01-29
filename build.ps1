# Maven 编译脚本（需要先安装 Maven）
# 如果系统没有 Maven，可以下载 Maven 并解压到任意位置
# 然后将 Maven bin 目录添加到 PATH 环境变量

# 检查 Maven 是否已安装
Write-Host "检查 Maven 是否已安装..." -ForegroundColor Cyan

try {
    $mvnVersion = mvn -v 2>&1
    Write-Host $mvnVersion -ForegroundColor Green
} catch {
    Write-Host "Maven 未安装，请按照以下步骤安装：" -ForegroundColor Red
    Write-Host "1. 访问 https://maven.apache.org/download.cgi"
    Write-Host "2. 下载 Binary zip archive"
    Write-Host "3. 解压到任意目录（如 C:\maven-3.9.x）"
    Write-Host "4. 添加 MAVEN_HOME 环境变量，指向解压目录"
    Write-Host "5. 将 %MAVEN_HOME%\bin 添加到 PATH 环境变量"
    Write-Host "6. 重启终端并再次运行此脚本"
    exit 1
}

Write-Host ""
Write-Host "开始编译项目..." -ForegroundColor Cyan
Write-Host ""

# 进入项目目录
cd $PSScriptRoot

# 清理并编译
mvn clean package

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "编译成功！" -ForegroundColor Green
    Write-Host "JAR 文件位置: target/wangshangdangaodian-0.0.1-SNAPSHOT.jar" -ForegroundColor Green
    Write-Host ""
    Write-Host "现在可以运行项目了，请执行: java -jar target/wangshangdangaodian-0.0.1-SNAPSHOT.jar" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "编译失败，请检查错误信息" -ForegroundColor Red
    exit 1
}
