# CodeTranscriptor

**CodeTranscriptor** es una herramienta ligera para Windows que recorre carpetas de código y genera un único archivo de texto con todo el contenido exportado.

## Qué hace

- Recorrer carpetas de forma recursiva
- Exportar archivos de código y texto comunes a un solo archivo (`Codigo_Unificado.txt`)
- Excluir carpetas de ruido como `node_modules`, `.git`, `bin`, `obj`, `dist`, `build`, `.vs`, `.vscode`, `packages`, `vendor`, `__pycache__`
- Evitar incluir el archivo de salida en la exportación
- Manejar errores por archivo sin detener la ejecución

## Archivos del proyecto

- `ExportarCodigo.bat` — lanzador principal para Windows
- `ExportarCodigo.ps1` — script PowerShell que hace el trabajo real
- `README.md` — instrucciones de uso y explicación
- `.gitignore` — archivos que no deben subirse al repositorio

## Cómo usarlo (paso a paso)

1. Copia `ExportarCodigo.bat` y `ExportarCodigo.ps1` al directorio raíz de tu proyecto de código.
2. Abre el explorador de Windows y navega a esa carpeta.
3. Ejecuta `ExportarCodigo.bat` con doble clic o desde un terminal.
4. Se generará `Codigo_Unificado.txt` en la misma carpeta.

> Si el script no puede escribir en `%TEMP%`, revisa permisos o ejecuta desde un usuario con permisos normales en Windows.

## Resultado final

- `Codigo_Unificado.txt` contiene la transcripción de los archivos escaneados.
- Puedes borrar `Codigo_Unificado.txt` en cualquier momento; no es necesario para el funcionamiento futuro del proyecto.

## Contenido incluido

El exportador procesa archivos con estas extensiones:

`.ino, .c, .cpp, .h, .hpp, .py, .js, .ts, .jsx, .tsx, .html, .htm, .css, .scss, .json, .xml, .yml, .yaml, .bat, .cmd, .ps1, .java, .cs, .vb, .php, .rb, .go, .rs, .sql, .sh, .ini, .cfg, .conf, .txt, .md`

## Qué se excluye

- Archivos dentro de carpetas basura listadas arriba
- El propio archivo de salida `Codigo_Unificado.txt`
- Cualquier archivo cuyo nombre empiece con `Codigo_Unificado`

## Ejemplo rápido

Abre un terminal en la carpeta del proyecto y ejecuta:

```powershell
./ExportarCodigo.bat
```

## Captura de la ejecución

![Captura de ejecución](screenshots/usage-example.png)

## Consejos

- Mantén `ExportarCodigo.bat` y `ExportarCodigo.ps1` juntos en la misma carpeta.
- Si necesitas agregar más extensiones, edita la lista de `$extensions` en `ExportarCodigo.ps1`.
- Si quieres excluir carpetas adicionales, añade sus nombres a `$excludedDirs`.

## Sobre el proyecto

Este proyecto se construyó usando GitHub Copilot y ChatGPT para que tengas una herramienta rápida de exportación de código.

## Siguiente paso para GitHub

1. Crea un repositorio en tu cuenta de GitHub.
2. Copia los archivos al directorio del repositorio.
3. Inicializa Git y sube los cambios.

Si quieres, puedo ayudarte a crear el repositorio remoto cuando tengas un token o acceso a GitHub CLI.
