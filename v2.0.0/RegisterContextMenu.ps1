$ErrorActionPreference = 'Stop'
$installDir = 'C:\Program Files\Exportador Codigo'

if (-not (Test-Path -LiteralPath $installDir)) {
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null
}

$folderShell = 'HKCU:\Software\Classes\Directory\shell\ExportarCodigo'
$folderCommand = Join-Path $folderShell 'command'
$backgroundShell = 'HKCU:\Software\Classes\Directory\Background\shell\ExportarCodigo'
$backgroundCommand = Join-Path $backgroundShell 'command'

$exportScript = Join-Path $installDir 'ExportarCodigoContextMenu.ps1'
if (-not (Test-Path -LiteralPath $exportScript)) {
    throw "ExportarCodigoContextMenu.ps1 no se encontró en $installDir"
}

$cmdFolder = "powershell.exe -NoProfile -ExecutionPolicy Bypass -File `"$exportScript`" -FolderPath `"%1`""
$cmdBackground = "powershell.exe -NoProfile -ExecutionPolicy Bypass -File `"$exportScript`" -FolderPath `"%V`""

New-Item -Path $folderShell -Force | Out-Null
Set-ItemProperty -Path $folderShell -Name '(Default)' -Value 'Exportar código'
Set-ItemProperty -Path $folderShell -Name 'Icon' -Value $exportScript
New-Item -Path $folderCommand -Force | Out-Null
Set-ItemProperty -Path $folderCommand -Name '(Default)' -Value $cmdFolder

New-Item -Path $backgroundShell -Force | Out-Null
Set-ItemProperty -Path $backgroundShell -Name '(Default)' -Value 'Exportar código'
Set-ItemProperty -Path $backgroundShell -Name 'Icon' -Value $exportScript
New-Item -Path $backgroundCommand -Force | Out-Null
Set-ItemProperty -Path $backgroundCommand -Name '(Default)' -Value $cmdBackground

Write-Host '[OK] Menú contextual instalado correctamente.' -ForegroundColor Green
