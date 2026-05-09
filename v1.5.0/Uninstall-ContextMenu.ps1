$ErrorActionPreference = 'Stop'

$folderShell = 'HKCU:\Software\Classes\Directory\shell\ExportarCodigo'
$backgroundShell = 'HKCU:\Software\Classes\Directory\Background\shell\ExportarCodigo'

if (Test-Path -LiteralPath $folderShell) {
    Remove-Item -Path $folderShell -Recurse -Force
}

if (Test-Path -LiteralPath $backgroundShell) {
    Remove-Item -Path $backgroundShell -Recurse -Force
}

Write-Host ''
Write-Host '[OK] Menú contextual desinstalado correctamente.' -ForegroundColor Green
