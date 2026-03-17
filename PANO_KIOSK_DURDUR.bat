@echo off
echo Kiosk tarayicilari kapatiliyor...
taskkill /f /im msedge.exe >nul 2>&1
taskkill /f /im chrome.exe >nul 2>&1
echo Tamamlandi.
timeout /t 1 >nul
