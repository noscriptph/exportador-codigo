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

## Paquete instalable

Se crea un paquete 7z con la versión 2.0.0:

- `exportador-codigo-2.0.0.7z`

Al extraerlo, ejecuta `Install-ContextMenu.bat` desde la carpeta `v2.0.0`.

## Notas

La versión original está preservada exactamente como estaba funcionando. La nueva versión ofrece instalación y desinstalación del menú contextual sin modificar la versión actual.
