$root = Split-Path -LiteralPath $MyInvocation.MyCommand.Path -Parent
$archive = Join-Path $root 'v2.0.0.sfx.7z'
$installer = Join-Path $root 'exportador-codigo-2.0.0-installer.exe'
$archiveSource = Join-Path $root 'v2.0.0'
$sevenZip = 'C:\Program Files\7-Zip\7z.exe'
$sfx = 'C:\Program Files\7-Zip\7z.sfx'

if (-not (Test-Path $sevenZip)) { throw '7z.exe no se encontró en C:\Program Files\7-Zip\7z.exe' }
if (-not (Test-Path $sfx)) { throw '7z.sfx no se encontró en C:\Program Files\7-Zip\7z.sfx' }

Set-Location -LiteralPath $archiveSource
& $sevenZip a -t7z $archive * -mx=9 | Out-Null

$config = @'
;!@Install@!UTF-8!
Title="Exportador Código 2.0.0"
BeginPrompt="Se extraerá el instalador. ¿Deseas continuar?"
RunProgram="Install-ContextMenu.bat"
;!@InstallEnd@!
'@

$cfgPath = Join-Path $root 'installer-config.txt'
$config | Set-Content -LiteralPath $cfgPath -Encoding UTF8
Copy-Item -Path $sfx -Destination (Join-Path $root '7z.sfx') -Force
cmd.exe /c copy /b "7z.sfx"+"installer-config.txt"+"v2.0.0.sfx.7z" "exportador-codigo-2.0.0-installer.exe" | Out-Null

Remove-Item -LiteralPath (Join-Path $root '7z.sfx') -Force
Remove-Item -LiteralPath $cfgPath -Force
Remove-Item -LiteralPath $archive -Force

Write-Host "Installer creado en: $installer"