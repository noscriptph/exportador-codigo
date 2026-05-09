$ErrorActionPreference = 'Stop'
$installDir = 'C:\Program Files\Exportador Codigo'

$folderShell = 'HKCU:\Software\Classes\Directory\shell\ExportarCodigo'
$backgroundShell = 'HKCU:\Software\Classes\Directory\Background\shell\ExportarCodigo'

if (Test-Path -LiteralPath $folderShell) {
    Remove-Item -Path $folderShell -Recurse -Force
    Write-Host '[OK] Entrada de menú carpeta removida.' -ForegroundColor Green
}

if (Test-Path -LiteralPath $backgroundShell) {
    Remove-Item -Path $backgroundShell -Recurse -Force
    Write-Host '[OK] Entrada de menú fondo removida.' -ForegroundColor Green
}

if (Test-Path -LiteralPath $installDir) {
    Remove-Item -Path $installDir -Recurse -Force
    Write-Host '[OK] Carpeta de instalación removida.' -ForegroundColor Green
}

Write-Host '[OK] Desinstalación completada.' -ForegroundColor Green
