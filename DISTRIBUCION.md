# Ficha final de distribución — Ethic Keyboard

Estado: **condicionado a firma y publicación del artefacto**.

## Identidad

- Nombre: Ethic Keyboard
- Paquete Android: `org.jpi59.teclado`
- Versión preparada: `6.6` (`versionCode 148`)
- Licencia del conjunto: GNU GPLv3 o posterior; se conservan los avisos Apache 2.0 heredados.
- Política de privacidad pública prevista: `https://jpi59.github.io/ethic-keyboard/privacy.html`

## Qué se ha comprobado

- El código no declara permisos de red ni dependencias de anuncios o telemetría.
- El manifiesto declara únicamente `VIBRATE` como permiso normal.
- La compilación release reproduce `app-release-unsigned.apk`.
- Los scripts de privacidad y licencias pasan en este entorno.
- El árbol actual no contiene las capturas ni el recurso promocional de licencia incierta.

## Bloqueos antes de publicar

1. Firmar el APK con un keystore del titular, fuera del repositorio, y conservar la huella SHA-256.
2. Ejecutar `scripts/firmar-release.sh`, verificar con `apksigner` y probar instalación/actualización en un dispositivo.
3. Publicar el repositorio o un repositorio público limpio y activar GitHub Pages para `docs/`.
4. Confirmar que la URL de privacidad responde sin autenticación y coincide con el APK publicado.
5. Generar metadatos de F-Droid y enviar el repositorio para revisión; no afirmar disponibilidad hasta la aceptación.

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
