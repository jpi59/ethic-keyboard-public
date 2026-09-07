# Contribuciones propias y política de licencias

Fecha: 2026-09-07  
Base de comparación: `ae49483ce31fc030ac20a96c37f34aaef2f78957`  
Proyecto: Ethic Keyboard (`jpi59`)

## Regla de atribución

Este repositorio es una obra derivada. La comparación con el commit base identifica qué cambios se hicieron en jpi59, pero no convierte el código heredado en código de jpi59. Los avisos de AOSP, Simple Keyboard y demás colaboradores siguen aplicándose a los archivos derivados.

## Archivos y materiales creados principalmente por jpi59

Estos elementos son documentación, automatización o configuración del proyecto jpi59 y no sustituyen la licencia del código heredado:

- `.github/workflows/ci.yml` — integración continua y comprobación de privacidad.
- `scripts/verificar-privacidad.sh` — comprobación reproducible del manifiesto y del APK.
- `PRIVACY_JPI59.md` — política del producto jpi59.
- `AUDITORIA-LICENCIAS-ETHIC-KEYBOARD.md` — informe de auditoría.
- `CONTRIBUCIONES-JPI59.md` — este inventario.
- `RELEASE.md` y `scripts/firmar-release.sh` — preparación de firma reproducible sin secretos.
- `NOTICE.md` — documentación de procedencia y atribuciones, con contenido heredado identificado.
- Cambios propios de `README.md`, `metadata/` y configuración de compilación.

Licencia adoptada para el contenido original de jpi59 dentro de la obra combinada: **GNU GPLv3 o posterior**. El código heredado conserva Apache 2.0 y sus avisos; `LICENSE-APACHE-2.0` se incluye por separado.

## Archivos derivados o mixtos

### Código Java

Los archivos bajo `app/src/main/java/org/jpi59/teclado/` son renombrados y adaptados desde `app/src/main/java/rkr/simplekeyboard/inputmethod/`. La comparación Git registra renombres con similitud aproximada del 71–99 %. Son archivos mixtos: contienen código heredado y cambios de namespace, identidad o adaptación. Deben conservar Apache 2.0 y sus avisos originales; las aportaciones nuevas de jpi59 se identifican en los commits y no se separan como si fueran obras independientes.

### Recursos XML

Los recursos bajo `app/src/main/res/` conservan la procedencia AOSP/upstream. Los cambios de jpi59 incluyen identidad visual, textos, nombre de aplicación, enlaces de documentación y la sección `Transparency` de ajustes. Los archivos XML modificados directamente por jpi59 llevan un aviso adicional cuando corresponde.

### Configuración y distribución

`app/build.gradle`, `app/proguard-rules.pro`, `gradlew`, `gradlew.bat`, `gradle/wrapper/` y `gradle.properties` contienen cambios de construcción o reproducibilidad. Son herramientas/configuración; no constituyen una relicencia del código de la aplicación. El wrapper debe conservar las condiciones de su distribución upstream.

### Imágenes e iconos

`icons/icon.svg`, `icons/ic_launcher-playstore.png` y la adaptación de los vectores Android son recursos gráficos originales/adaptados por jpi59. Las capturas y el recurso promocional heredados sin ficha individual cerrada se retiraron del árbol actual; sus objetos siguen en el historial Git privado y deben purgarse antes de hacer público el historial completo.

## Cambios propios por commit

| Commit | Contribución | Clasificación |
|---|---|---|
| `ed9f55b2` | adaptación de namespace/paquete, configuración, documentación y políticas | mixta: derivada + jpi59 |
| `984ef684` | wrapper reproducible, CI y comprobación de privacidad | principalmente jpi59/configuración |
| `852b3613` | marca Ethic Keyboard y textos en recursos/metadatos | mixta: recursos heredados modificados |
| `558351c1` | sección Transparency y resúmenes de privacidad/licencia | jpi59 sobre XML heredado |
| `e4ed405f` | enlaces a la rama `master` | jpi59 sobre recurso heredado |
| `a70f676d` | auditoría, avisos de copyright y documentación | principalmente jpi59 |

## Cómo debe publicarse

1. Distribuir `LICENSE` y `NOTICE.md` junto al código y al APK cuando corresponda.
2. No eliminar avisos de copyright ni atribuciones de archivos heredados.
3. Declarar los cambios de jpi59 sin afirmar autoría exclusiva sobre AOSP/Simple Keyboard.
4. Aplicar GPLv3-or-later a la obra combinada sin borrar ni sustituir los avisos Apache de los archivos heredados.
5. Completar la ficha de recursos gráficos antes de hacer una publicación pública definitiva.

Este inventario es una documentación técnica de autoría y procedencia; no sustituye asesoramiento jurídico profesional.
