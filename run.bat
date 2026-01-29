@echo off
REM 项目启动脚本
REM 请确保 Java 已安装，且 JAVA_HOME 已配置

echo 开始启动 Web 应用...
echo.

cd /d %~dp0

REM 设置 Java 类路径
set CLASSPATH=.;.\target\classes;.\src\main\resources

REM 查找 lib 目录中的所有 jar 文件
for /r .\target\dependency %%i in (*.jar) do (
    set CLASSPATH=!CLASSPATH!;%%i
)

REM 启动 Spring Boot 应用
echo CLASSPATH=%CLASSPATH%
echo.
echo 启动应用，访问地址: http://localhost:8080/wangshangdangaodian
echo.

java -cp %CLASSPATH% com.wangshangdangaodianApplication

pause
