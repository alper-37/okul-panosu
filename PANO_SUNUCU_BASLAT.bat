@echo off
chcp 65001 >nul
title Okul Panosu - HTTP Sunucu
echo ============================================
echo   OKUL PANOSU - YEREL AĞ HTTP SUNUCUSU
echo ============================================
echo.

REM --- Ayarlar ---
set PORT=8080
set FILE=Okul_Panosu.html

REM --- IP adresini bul ---
echo Ağ bilgileri:
echo.
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /i "IPv4"') do (
    set IP=%%a
    echo   Yerel IP: %%a
)
echo.
echo ============================================
echo   Panoya erişim adresleri:
echo.
echo   Bu bilgisayardan:  http://localhost:%PORT%
echo   Yerel ağdan:       http://%IP%:%PORT%
echo.
echo   (Aynı WiFi/LAN ağındaki cihazlardan
echo    yukarıdaki IP adresiyle erişebilirsiniz)
echo ============================================
echo.
echo Sunucuyu durdurmak için bu pencereyi kapatın
echo veya Ctrl+C tuşlarına basın.
echo.

REM --- Python HTTP sunucusu başlat ---
cd /d "%~dp0"
python -c "import http.server, socketserver, os; os.chdir(r'%~dp0'); handler = http.server.SimpleHTTPRequestHandler; httpd = socketserver.TCPServer(('0.0.0.0', %PORT%), handler); print(f'Sunucu çalışıyor: http://0.0.0.0:%PORT%'); httpd.serve_forever()"

if %errorlevel% neq 0 (
    echo.
    echo Python bulunamadı, Node.js deneniyor...
    npx -y serve -l %PORT% -s "%~dp0"
)

pause
