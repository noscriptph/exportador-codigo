param(
    [Parameter(Mandatory=$true)][string]$FolderPath
)

$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = New-Object System.Text.UTF8Encoding($false)

function Get-CodeFiles {
    param([string]$Root)
    $extensions = @('.ino','.c','.cpp','.h','.hpp','.py','.js','.ts','.jsx','.tsx','.html','.htm','.css','.scss','.json','.xml','.yml','.yaml','.bat','.cmd','.ps1','.java','.cs','.vb','.php','.rb','.go','.rs','.sql','.sh','.ini','.cfg','.conf','.txt','.md')
    $excludedDirs = @('node_modules','.git','bin','obj','dist','build','.vs','.vscode','packages','vendor','__pycache__')
    Get-ChildItem -LiteralPath $Root -Recurse -File -Force -ErrorAction SilentlyContinue | Where-Object {
        ($extensions -contains $_.Extension.ToLower()) -and
        -not ($_.FullName.Split([System.IO.Path]::DirectorySeparatorChar) | Where-Object { $excludedDirs -contains $_ })
    }
}

function Export-Code {
    param([string]$Root,[string]$OutFile)
    $header = "============================================================`r`nEXPORTACION UNIFICADA DE CODIGO`r`nFecha: $(Get-Date)`r`nDirectorio raiz: $Root`r`nEquipo: $env:COMPUTERNAME`r`nUsuario: $env:USERNAME`r`n============================================================"
    Set-Content -LiteralPath $OutFile -Value $header -Encoding UTF8 -Force
    $files = Get-CodeFiles -Root $Root | Where-Object {
        ($_.FullName -ne $OutFile) -and
        ($_.Name -notlike 'Codigo_Unificado*')
    }
    foreach ($file in $files) {
        try {
            $content = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8 -ErrorAction Stop
            $section = "`r`n============================================================`r`nARCHIVO: $($file.FullName)`r`nEXTENSION: $($file.Extension)`r`nTAMANO: $($file.Length) bytes`r`n============================================================`r`n$content"
            Add-Content -LiteralPath $OutFile -Value $section -Encoding UTF8 -Force
        } catch {
            $errorSection = "`r`n============================================================`r`nERROR LEYENDO: $($file.FullName)`r`nDETALLE: $($_.Exception.Message)`r`n============================================================"
            Add-Content -LiteralPath $OutFile -Value $errorSection -Encoding UTF8 -Force
        }
    }
}

try {
    $resolved = Resolve-Path -LiteralPath $FolderPath -ErrorAction Stop
    $targetFolder = $resolved.Path
    $outputFile = Join-Path $targetFolder 'Codigo_Unificado.txt'

    Write-Host ''
    Write-Host 'Exportando codigo desde:' -ForegroundColor Cyan
    Write-Host $targetFolder -ForegroundColor Yellow
    Write-Host 'Archivo de salida:' -ForegroundColor Yellow
    Write-Host $outputFile -ForegroundColor Yellow

    Export-Code -Root $targetFolder -OutFile $outputFile

    if (Test-Path -LiteralPath $outputFile) {
        Write-Host ''
        Write-Host '[OK] Exportacion completada correctamente.' -ForegroundColor Green
        Write-Host '[OK] Archivo generado:' $outputFile -ForegroundColor Green
    } else {
        throw 'No se pudo generar el archivo final.'
    }
} catch {
    Write-Host ''
    Write-Host '[ERROR]' $_.Exception.Message -ForegroundColor Red
}

Write-Host ''
Write-Host 'Presiona ENTER para cerrar.' -ForegroundColor DarkYellow
Read-Host | Out-Null
