@echo off
setlocal EnableExtensions DisableDelayedExpansion
chcp 65001 >nul 2>&1

:: ============================================================
:: EXPORTADOR UNIFICADO DE CODIGO
:: Guardar como ExportarCodigo.bat
:: ============================================================

where powershell >nul 2>&1
if %errorlevel% neq 0 (
echo [ERROR] PowerShell no esta disponible.
pause
exit /b 1
)

set "ROOT_DIR=%~dp0"
if "%ROOT_DIR:~-1%"=="\" set "ROOT_DIR=%ROOT_DIR:~0,-1%"
set "OUTPUT_FILE=%ROOT_DIR%\Codigo_Unificado.txt"
set "PS_SCRIPT=%~dp0ExportarCodigo.ps1"

:: --- Probar permisos de escritura ---
set "TEST_FILE=%TEMP%\permtest_%RANDOM%.tmp"
echo test>"%TEST_FILE%" 2>nul
if not exist "%TEST_FILE%" (
echo [ERROR] No hay permisos suficientes para escribir archivos temporales.
echo [INFO] Ejecute este script con permisos adecuados o compruebe la carpeta TEMP.
pause
exit /b 1
)
del "%TEST_FILE%" >nul 2>&1

if not exist "%PS_SCRIPT%" (
    echo [ERROR] No se pudo encontrar el script PowerShell.
    echo [INFO] Asegurese de que ExportarCodigo.ps1 exista en la misma carpeta.
    pause
    exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%" -RootPath "%ROOT_DIR%" -OutputFile "%OUTPUT_FILE%"

if exist "%OUTPUT_FILE%" (
echo.
echo [OK] Archivo creado exitosamente:
echo %OUTPUT_FILE%
) else (
echo.
echo [ERROR] No se genero el archivo esperado.
echo [INFO] Puede existir bloqueo por antivirus, carpeta protegida o permisos adicionales.
)

pause
endlocal
exit /b
