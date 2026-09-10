# Ficha final de distribución — Ethic Keyboard

Estado: **preparación de tiendas; no publicada**.

## Identidad

- Nombre: Ethic Keyboard
- Paquete Android: `org.jpi59.teclado`
- Versión preparada: `6.6.3` (`versionCode 151`)
- Licencia del conjunto: GNU GPLv3 o posterior; se conservan los avisos Apache 2.0 heredados.
- Política de privacidad integrada: `PRIVACY_JPI59.md`, accesible desde los ajustes de la aplicación.

## Qué se ha comprobado

- El código no declara permisos de red ni dependencias de anuncios o telemetría.
- El manifiesto declara únicamente `VIBRATE` como permiso normal.
- El respaldo automático y las solicitudes de copia de seguridad del sistema están desactivados.
- La compilación release reproduce `app-release-unsigned.apk`.
- Los scripts de privacidad y licencias pasan en este entorno.
- El árbol actual no contiene las capturas ni el recurso promocional de licencia incierta.

## Bloqueos antes de publicar

1. Completar la procedencia individual de los recursos gráficos indicada en `AUDITORIA-LICENCIAS-ETHIC-KEYBOARD.md` o retirarlos.
2. Etiquetar el commit de la versión y publicar el código fuente exacto que se distribuirá.
3. Confirmar que la URL pública de privacidad responde sin autenticación, coincide con el APK/AAB y contiene la identidad pública elegida para la ficha de tienda.
4. Preparar y validar la receta de compilación de F-Droid contra el commit etiquetado; no afirmar disponibilidad hasta la aceptación de F-Droid.
5. Para Google Play, generar un Android App Bundle (`.aab`), inscribir la clave de firma existente en Play App Signing y completar la ficha, clasificación de contenido y Data safety con declaraciones verificadas.

## Compatibilidad entre canales

La APK directa de Ethic Keyboard se firma con la clave del titular. F-Droid firma
por defecto sus APK compiladas desde fuente con su propia clave. Por ello, una
instalación directa no se puede actualizar sobre una versión firmada por F-Droid
sin desinstalar primero la aplicación, lo que borra sus preferencias locales.
La ficha de F-Droid debe explicar esta migración antes de ser aceptada. Google
Play debe usar la clave de firma existente mediante Play App Signing para evitar
ese problema con instalaciones directas.

## Comandos de verificación

```bash
./gradlew :app:assembleRelease --no-daemon
./scripts/verificar-licencias.sh
./scripts/verificar-privacidad.sh app/build/outputs/apk/release/app-release-unsigned.apk
export KEYSTORE_PATH="/ruta/privada/ethic-keyboard-release.jks"
export KEY_ALIAS="ethic-keyboard"
export STORE_PASSWORD='...'
export KEY_PASSWORD='...'
./scripts/firmar-release.sh
```

No se debe publicar el APK sin firma ni incluir contraseñas, keystore o rutas privadas en Git.
