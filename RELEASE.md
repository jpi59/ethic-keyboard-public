# Preparación de una entrega release

La compilación release actual genera:

```text
app/build/outputs/apk/release/app-release-unsigned.apk
```

Ese archivo no se debe publicar todavía: carece de una firma de distribución. La clave privada debe ser creada, respaldada y custodiada por el titular del proyecto; nunca debe entrar en Git, `local.properties` ni una variable persistente del repositorio.

## Firma local

Después de compilar, define las variables solo en la sesión local:

```bash
source /home/Familia/Proyectos/jpi59/entorno-android-jpi59.sh
./gradlew :app:assembleRelease --no-daemon
export KEYSTORE_PATH="/ruta/privada/ethic-keyboard-release.jks"
export KEY_ALIAS="ethic-keyboard"
export STORE_PASSWORD='contraseña-del-keystore'
export KEY_PASSWORD='contraseña-de-la-clave'
./scripts/firmar-release.sh
```

El script alinea, firma y verifica el APK. Las contraseñas no se escriben en archivos del repositorio ni en los registros de CI.

Antes de publicar, registra de forma privada la huella SHA-256 del certificado, prueba instalación/actualización en un dispositivo y conserva una copia de seguridad del keystore. Perder la clave impedirá actualizar la aplicación con el mismo paquete.
