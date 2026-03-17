@echo off
setlocal enableextensions
cd /d "%~dp0"

set "PANO_FILE=%~dp0Okul_Panosu.html"
set "PANO_URL=file:///%PANO_FILE:\=/%"

set "EDGE_EXE="
if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" set "EDGE_EXE=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if exist "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" set "EDGE_EXE=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"

set "CHROME_EXE="
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set "CHROME_EXE=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" set "CHROME_EXE=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" set "CHROME_EXE=%LocalAppData%\Google\Chrome\Application\chrome.exe"

echo Pano kiosku baslatiliyor...

if defined EDGE_EXE (
    start "" "%EDGE_EXE%" --kiosk "%PANO_URL%" --edge-kiosk-type=fullscreen --no-first-run --disable-features=msUndersideButton
    goto :ok
)

if defined CHROME_EXE (
    start "" "%CHROME_EXE%" --kiosk "%PANO_URL%" --no-first-run
    goto :ok
)

echo.
echo Edge veya Chrome bulunamadi.
echo Lutfen bir tarayici kurun ve tekrar deneyin.
pause
goto :eof

:ok
echo Baslatildi. Cikmak icin ALT+F4 kullanabilirsiniz.
timeout /t 2 >nul
