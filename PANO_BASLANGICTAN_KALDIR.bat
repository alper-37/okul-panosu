@echo off
setlocal enableextensions

set "STARTUP_DIR=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "TARGET_VBS=%STARTUP_DIR%\Pano Kiosk Baslat.vbs"

if exist "%TARGET_VBS%" (
    del /f /q "%TARGET_VBS%"
    echo Baslangic kaydi silindi.
) else (
    echo Baslangic kaydi bulunamadi.
)

timeout /t 1 >nul
