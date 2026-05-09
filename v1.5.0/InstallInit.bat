@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul 2>&1

set "INSTALL_DIR=C:\Program Files\Exportador Codigo"
set "PS_SCRIPT=%~dp0Install-ContextMenu.ps1"

if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"

echo Instalando Exportador Codigo en %INSTALL_DIR%...

copy /Y "%~dp0ExportarCodigoContextMenu.ps1" "%INSTALL_DIR%\"
copy /Y "%~dp0Install-ContextMenu.ps1" "%INSTALL_DIR%\"
copy /Y "%~dp0Uninstall-ContextMenu.ps1" "%INSTALL_DIR%\"
copy /Y "%~dp0VERSION" "%INSTALL_DIR%\"

if exist "%~dp0uninstaller.exe" (
    copy /Y "%~dp0uninstaller.exe" "%INSTALL_DIR%\"
)

cd /d "%INSTALL_DIR%"
powershell -NoProfile -ExecutionPolicy Bypass -File "%INSTALL_DIR%\Install-ContextMenu.ps1"

echo.
echo [OK] Instalacion completada en: %INSTALL_DIR%
echo.
pause
endlocal
