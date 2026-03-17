@echo off
setlocal enableextensions

set "TASK_NAME=OkulPanosuKiosk"
set "SOURCE_BAT=%~dp0PANO_KIOSK_BASLAT.bat"

if not exist "%SOURCE_BAT%" (
    echo Hata: PANO_KIOSK_BASLAT.bat bulunamadi.
    pause
    exit /b 1
)

echo Gorev zamanlayici kaydi olusturuluyor: %TASK_NAME%
schtasks /Create /TN "%TASK_NAME%" /SC ONLOGON /TR "cmd /c \"%SOURCE_BAT%\"" /RL LIMITED /F >nul 2>&1

if errorlevel 1 (
    echo Islem basarisiz oldu.
    echo Manuel kontrol: schtasks /Query /TN "%TASK_NAME%"
    pause
    exit /b 1
)

echo Tamamlandi. Oturum acildiginda pano kiosk otomatik baslayacak.
timeout /t 2 >nul
