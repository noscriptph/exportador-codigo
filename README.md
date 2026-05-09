# Exportador de Código

Este repositorio contiene dos versiones del proyecto:

- `v1.0.0` — versión estable original que funciona con `ExportarCodigo.bat` y `ExportarCodigo.ps1`.
- `v2.0.0` — nueva versión que instala una opción en el menú contextual de Windows.

## Estructura del repositorio

- `v1.0.0/` — proyecto actual preservado y estable.
- `v2.0.0/` — nueva versión con instalador de menú contextual.

## Cómo usar cada versión

### v1.0.0

1. Entra en la carpeta `v1.0.0`.
2. Ejecuta `ExportarCodigo.bat`.
3. Se genera `Codigo_Unificado.txt` en la carpeta en la que ejecutes el script.

### v2.0.0

1. Entra en la carpeta `v2.0.0`.
2. Ejecuta `Install-ContextMenu.bat` o `Install-ContextMenu.ps1`.
3. Haz clic derecho en cualquier carpeta o fondo de carpeta y elige `Exportar código`.
4. Se generará `Codigo_Unificado.txt` dentro de la carpeta seleccionada.

## Versiones

- `v1.0.0` — versión original estable.
- `v2.0.0` — versión con integración al menú contextual.

## Instalación

El instalador está disponible en tu escritorio:

- **`exportador-codigo-2.0.0-installer.exe`**

Este instalador:
1. Instala los archivos en `C:\Program Files\Exportador Codigo`
2. Registra la opción `Exportar código` en el menú contextual
3. Crea un desinstalador automático

## Paquetes alternativos

También están disponibles:

- `exportador-codigo-2.0.0.7z` — paquete comprimido
- `v2.0.0/uninstaller.exe` — desinstalador independiente

## Notas

La versión original está preservada exactamente como estaba funcionando. La nueva versión ofrece instalación y desinstalación del menú contextual sin modificar la versión actual.
