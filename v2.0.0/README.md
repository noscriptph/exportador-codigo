# Exportador de Código v2.0.0

Esta versión agrega una opción instalada en el menú contextual de Windows.

## Archivos de la versión 2.0.0

- `ExportarCodigoContextMenu.ps1` — exporta el código del directorio seleccionado y genera `Codigo_Unificado.txt`.
- `Install-ContextMenu.ps1` — instala la opción en el menú contextual.
- `Install-ContextMenu.bat` — wrapper para ejecutar el instalador desde el explorador.
- `Uninstall-ContextMenu.ps1` — elimina la opción del menú contextual.
- `Uninstall-ContextMenu.bat` — wrapper para desinstalar desde el explorador.
- `VERSION` — número de versión.

## Instalación

1. Abre la carpeta `v2.0.0`.
2. Ejecuta `Install-ContextMenu.bat` con doble clic.
3. Si aparece un mensaje de confirmación, el menú contextual quedará instalado.

## Uso

1. Ve a cualquier carpeta de código en el Explorador de Windows.
2. Haz clic derecho en la carpeta o en el fondo de la carpeta.
3. Selecciona `Exportar código`.
4. Se generará el archivo `Codigo_Unificado.txt` dentro de la carpeta seleccionada.

## Desinstalación

Ejecuta `Uninstall-ContextMenu.bat` para quitar la opción del menú contextual.

## Requisitos

- Windows PowerShell 5.1 o superior.
- Permisos de usuario normal (no requiere administrador para HKCU).

## Paquete instalable

También puedes usar el paquete `exportador-codigo-2.0.0.7z` desde la raíz del repositorio.

Al extraer el paquete, ejecuta `Install-ContextMenu.bat` desde la carpeta `v2.0.0`.

También existe un instalador EXE directo:

- `exportador-codigo-2.0.0-installer.exe`

Ejecuta ese EXE para instalar la opción `Exportar código` directamente sin extraer.

## Consideraciones

El archivo resultante se guarda en la carpeta seleccionada y se sobrescribe si ya existe.
