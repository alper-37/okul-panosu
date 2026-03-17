@echo off
setlocal enableextensions

set "SOURCE_BAT=%~dp0PANO_KIOSK_BASLAT.bat"
if not exist "%SOURCE_BAT%" (
    echo Hata: PANO_KIOSK_BASLAT.bat bulunamadi.
    pause
    exit /b 1
)

set "STARTUP_DIR=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "TARGET_VBS=%STARTUP_DIR%\Pano Kiosk Baslat.vbs"

echo Windows baslangicina kiosk gorevi ekleniyor...
>"%TARGET_VBS%" echo Set WshShell = CreateObject("WScript.Shell")
>>"%TARGET_VBS%" echo WshShell.Run Chr(34) ^& "%SOURCE_BAT%" ^& Chr(34), 0, False

echo Tamamlandi: %TARGET_VBS%
echo Bilgisayar acildiginda pano kiosk otomatik baslayacak.
timeout /t 2 >nul
