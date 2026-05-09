@echo off
setlocal
cd /d C:\Program Files\Exportador Codigo
if exist "UninstallCleanup.ps1" (
    powershell -NoProfile -ExecutionPolicy Bypass -File "UninstallCleanup.ps1"
) else (
    echo [ERROR] UninstallCleanup.ps1 no se encontro en C:\Program Files\Exportador Codigo
    pause
    exit /b 1
)
endlocal
