@echo off
title DeadSec Serial Terminal Server
cd /d "%~dp0"

echo ============================================
echo   DeadSec Web Serial Terminal Launcher
echo ============================================
echo.
echo Server folder: %cd%
echo.

REM Check if index.html exists in this folder
if not exist "index.html" (
    echo [ERROR] index.html is folder mein nahi mila!
    echo Is .bat file ko index.html ke saath usi folder mein rakho.
    pause
    exit /b
)

echo Server start ho raha hai http://localhost:8000 par...
echo.
echo Server band karne ke liye is window mein Ctrl+C dabao.
echo.

REM Open the page in default browser after a short delay
start "" /min cmd /c "timeout /t 2 >nul && start http://localhost:8000"

REM Start the Python HTTP server (keeps this window running)
python -m http.server 8000

pause
