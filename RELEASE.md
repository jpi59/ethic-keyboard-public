# Preparación de una entrega release

La compilación release genera estos artefactos:

```text
app/build/outputs/apk/release/app-release-unsigned.apk
app/build/outputs/bundle/release/app-release.aab
```

Sin credenciales, ambos artefactos se generan sin firma de distribución. La clave privada debe ser creada, respaldada y custodiada por el titular del proyecto; nunca debe entrar en Git, `local.properties` ni una variable persistente del repositorio.

## Firma local

Después de compilar, define las variables solo en la sesión local:

```bash
source /home/Familia/Proyectos/jpi59/entorno-android-jpi59.sh
./gradlew :app:assembleRelease :app:bundleRelease --no-daemon
export KEYSTORE_PATH="/ruta/privada/ethic-keyboard-release.jks"
export KEY_ALIAS="ethic-keyboard"
export STORE_PASSWORD='contraseña-del-keystore'
export KEY_PASSWORD='contraseña-de-la-clave'
./scripts/firmar-release.sh
```

`scripts/firmar-release.sh` alinea, firma y verifica el APK. Cuando las cuatro
variables de firma están definidas solo en la sesión local, Gradle usa la misma
clave para firmar el AAB generado por `:app:bundleRelease`. Las contraseñas no se
escriben en archivos del repositorio ni en los registros de CI.

Google Play requiere el AAB y Play App Signing. Al registrar una aplicación que
ya se distribuyó con `org.jpi59.teclado`, se debe inscribir la clave de firma
existente para que las actualizaciones conserven compatibilidad con la APK ya
instalada.

Antes de publicar, registra de forma privada la huella SHA-256 del certificado, prueba instalación/actualización en un dispositivo y conserva una copia de seguridad del keystore. Perder la clave impedirá actualizar la aplicación con el mismo paquete.
