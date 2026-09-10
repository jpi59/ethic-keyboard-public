# Registro operativo de entrega ética

Última actualización: 2026-09-10

Este documento conserva hechos comprobados, decisiones y límites del proceso de
entrega de Ethic Keyboard. No almacena contraseñas, tokens, claves privadas,
rutas de credenciales ni identificadores del dispositivo.

## Entrega 6.6.3

- Versión: `6.6.3` (`versionCode 151`).
- Commit de endurecimiento: `3d96fda75f9d747e65a4e4cf0470343984edc440`.
- Referencias publicadas: rama `fdroid-hardening` y etiqueta anotada `v6.6.3`.
- La rama principal no fue modificada durante esta entrega.
- La receta de F-Droid vive en una contribución separada de `fdroiddata`:
  `metadata/org.jpi59.teclado.yml`.
- Solicitud de incorporación: https://gitlab.com/fdroid/fdroiddata/-/merge_requests/48454

## Controles comprobados

- El manifiesto resultante solicita solo `android.permission.VIBRATE`.
- No se declaró permiso de Internet y se deshabilitó el tráfico HTTP claro con
  `android:usesCleartextTraffic="false"`.
- El lanzamiento excluye metadatos de control de versiones y de dependencias
  que no son necesarios dentro del APK.
- La compilación de lanzamiento, `lintVitalRelease`, las comprobaciones de
  licencias y privacidad, y los pipelines de F-Droid de rama y de MR pasaron.
- F-Droid construyó la versión desde la receta publicada; eso no equivale por
  sí solo a una certificación de reproducibilidad byte a byte frente a un APK
  externo firmado por el desarrollador.
- La actualización local se firmó con la clave de distribución existente. El
  sistema Android la aceptó como actualización de la instalación previa, por
  lo que confirmó compatibilidad de firma. El dispositivo informó versión
  `6.6.3`/código `151` y conservó su fecha de primera instalación.

## Regla de publicación y firma

1. Nunca guardar contraseñas, tokens ni claves privadas en el repositorio,
   documentación, salida de comandos o mensajes.
2. Pedir la contraseña mediante un diálogo local con entrada oculta; mantenerla
   solo en memoria del proceso de compilación.
3. Usar siempre la clave de distribución ya asociada al paquete. No crear una
   clave nueva para actualizar una instalación existente.
4. Comprobar que existe un único alias esperado antes de firmar.
5. Usar un proceso que falle inmediatamente ante cualquier error (`set -e`).
6. Compilar desde limpio y con la ruta del SDK declarada explícitamente.
7. Antes de instalar, comprobar dentro de la APK el `versionCode` y
   `versionName` esperados, y verificar la firma con `apksigner`.
8. Actualizar con `adb install -r` únicamente después de esas comprobaciones;
   nunca desinstalar para forzar una firma incompatible, porque borraría datos.
9. Tras instalar, verificar versión, fecha de primera instalación y permisos
   desde el propio dispositivo.

## Lección incorporada

En un primer intento de instalación, una compilación falló por no tener la ruta
del SDK declarada y quedó disponible un APK firmado anterior. Android mantuvo
la versión anterior; no se borraron datos. A partir de ello, el procedimiento
exige compilación limpia, parada inmediata ante errores y comprobación interna
de versión antes de ejecutar cualquier instalación.

## Flujo F-Droid para próximas versiones

1. Crear una etiqueta de lanzamiento que apunte al commit exacto del código.
2. Mantener los metadatos Fastlane en `metadata/<locale>/` del código fuente:
   descripción corta, descripción completa y cambios por `versionCode`.
3. Actualizar la receta de `fdroiddata` en una rama dedicada, fijando commit,
   versión, código, salida Gradle y actualización por etiquetas.
4. Corregir primero los fallos comprobados por CI; no ocultar ni atribuir a un
   bot causas que no consten en sus registros.
5. Abrir la MR solo cuando los pipelines estén verdes. No activar fusión
   automática ni publicar binarios fuera de los canales autorizados.
6. Distinguir la validación automática de la decisión de los mantenedores.
   La MR actual está lista técnicamente, pero su incorporación definitiva y
   publicación dependen de F-Droid.

## Próxima revisión

Antes de cada lanzamiento, revisar este documento, las políticas vigentes de
los canales de distribución y los permisos efectivos del APK. Registrar aquí
solo evidencia verificable y cambios de proceso que reduzcan riesgos.
