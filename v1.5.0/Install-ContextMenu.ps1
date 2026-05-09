$ErrorActionPreference = 'Stop'
$scriptPath = Join-Path $PSScriptRoot 'ExportarCodigoContextMenu.ps1'
if (-not (Test-Path -LiteralPath $scriptPath)) {
    Write-Host '[ERROR] No se encontró ExportarCodigoContextMenu.ps1 en la carpeta de la versión 2.0.0.' -ForegroundColor Red
    exit 1
}

$folderShell = 'HKCU:\Software\Classes\Directory\shell\ExportarCodigo'
$folderCommand = Join-Path $folderShell 'command'
$backgroundShell = 'HKCU:\Software\Classes\Directory\Background\shell\ExportarCodigo'
$backgroundCommand = Join-Path $backgroundShell 'command'

$cmdFolder = "powershell.exe -NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`" -FolderPath `"%1`""
$cmdBackground = "powershell.exe -NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`" -FolderPath `"%V`""

New-Item -Path $folderShell -Force | Out-Null
Set-ItemProperty -Path $folderShell -Name '(Default)' -Value 'Exportar código con Exportador Código'
Set-ItemProperty -Path $folderShell -Name 'Icon' -Value $scriptPath
New-Item -Path $folderCommand -Force | Out-Null
Set-ItemProperty -Path $folderCommand -Name '(Default)' -Value $cmdFolder

New-Item -Path $backgroundShell -Force | Out-Null
Set-ItemProperty -Path $backgroundShell -Name '(Default)' -Value 'Exportar código con Exportador Código'
Set-ItemProperty -Path $backgroundShell -Name 'Icon' -Value $scriptPath
New-Item -Path $backgroundCommand -Force | Out-Null
Set-ItemProperty -Path $backgroundCommand -Name '(Default)' -Value $cmdBackground

Write-Host ''
Write-Host '[OK] Menú contextual instalado correctamente.' -ForegroundColor Green
Write-Host 'Haz clic derecho en una carpeta o en el fondo de una carpeta y selecciona Exportar código.'
