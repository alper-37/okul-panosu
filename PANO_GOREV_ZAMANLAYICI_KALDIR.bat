@echo off
setlocal enableextensions

set "TASK_NAME=OkulPanosuKiosk"
echo Gorev zamanlayici kaydi siliniyor: %TASK_NAME%
schtasks /Delete /TN "%TASK_NAME%" /F >nul 2>&1

if errorlevel 1 (
    echo Gorev bulunamadi veya silinemedi.
    exit /b 1
)

echo Tamamlandi.
timeout /t 1 >nul
