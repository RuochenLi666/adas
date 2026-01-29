
$MavenVersion = "3.9.12"
$MavenUrl = "https://dlcdn.apache.org/maven/maven-3/$MavenVersion/binaries/apache-maven-$MavenVersion-bin.zip"
$MavenDir = Join-Path $PSScriptRoot "maven-temp"
$MavenBin = Join-Path $MavenDir "apache-maven-$MavenVersion\bin\mvn.cmd"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "   Auto Install Maven & Run Project" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# Check if global maven exists
if (Get-Command "mvn" -ErrorAction SilentlyContinue) {
    Write-Host "Found global Maven. Running..." -ForegroundColor Green
    mvn spring-boot:run
    exit
}

# Check if local maven exists
if (-not (Test-Path $MavenBin)) {
    Write-Host "Maven not found. Downloading Maven $MavenVersion..." -ForegroundColor Yellow
    Write-Host "URL: $MavenUrl" -ForegroundColor Gray
    
    if (-not (Test-Path $MavenDir)) { New-Item -ItemType Directory -Path $MavenDir | Out-Null }
    
    $ZipPath = Join-Path $MavenDir "maven.zip"
    
    try {
        Invoke-WebRequest -Uri $MavenUrl -OutFile $ZipPath -UseBasicParsing
    } catch {
        Write-Host "Download failed: $_" -ForegroundColor Red
        exit 1
    }
    
    Write-Host "Download complete. Extracting..." -ForegroundColor Yellow
    Expand-Archive -Path $ZipPath -DestinationPath $MavenDir -Force
    
    # Clean up zip
    Remove-Item $ZipPath
    Write-Host "Maven installed successfully." -ForegroundColor Green
}

Write-Host "Starting Spring Boot Application..." -ForegroundColor Cyan
Write-Host "Note: First run may take time to download dependencies." -ForegroundColor Gray
Write-Host ""

& $MavenBin spring-boot:run
