@echo off
setlocal enableextensions
cd /d "%~dp0"

set "PORT=8080"
set "PAGE=Yeni_Pano.html"
set "PANO_URL=http://localhost:%PORT%/%PAGE%"

set "PY_CMD="
where py >nul 2>&1
if not errorlevel 1 set "PY_CMD=py -3"
if not defined PY_CMD (
    where python >nul 2>&1
    if not errorlevel 1 set "PY_CMD=python"
)

if not defined PY_CMD (
    echo Python bulunamadi.
    echo Cozum: Python kurun veya normal kiosk dosyasini kullanin.
    echo Dosya: PANO_KIOSK_BASLAT.bat
    pause
    exit /b 1
)

set "PORT_BUSY="
for /f "tokens=5" %%P in ('netstat -ano ^| findstr /R /C:":%PORT% .*LISTENING"') do (
    set "PORT_BUSY=1"
    goto :port_ready
)

:port_ready
if not defined PORT_BUSY (
    echo Yerel HTTP sunucu baslatiliyor (port %PORT%)...
    start "YENI_PANO_HTTP_%PORT%" /min cmd /c "cd /d ""%~dp0"" && %PY_CMD% -m http.server %PORT%"
    timeout /t 2 >nul
) else (
    echo Port %PORT% zaten acik. Mevcut sunucu kullanilacak.
)

set "EDGE_EXE="
if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" set "EDGE_EXE=%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"
if exist "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe" set "EDGE_EXE=%ProgramFiles%\Microsoft\Edge\Application\msedge.exe"

set "CHROME_EXE="
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" set "CHROME_EXE=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if exist "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" set "CHROME_EXE=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"
if exist "%LocalAppData%\Google\Chrome\Application\chrome.exe" set "CHROME_EXE=%LocalAppData%\Google\Chrome\Application\chrome.exe"

echo Yeni pano kiosku baslatiliyor...

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
echo Baslatildi: %PANO_URL%
echo Cikis icin ALT+F4, gerekirse PANO_KIOSK_DURDUR.bat kullanin.
timeout /t 2 >nul

