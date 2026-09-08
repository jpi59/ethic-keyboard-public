# Procedencia de recursos — Ethic Keyboard

Fecha de comprobación: 8 de septiembre de 2026

## Método y alcance

Cada archivo bajo `app/src/main/res/` e `icons/` se comparó byte a byte con el
commit `ae49483ce31fc030ac20a96c37f34aaef2f78957` de
[`rkkr/simple-keyboard`](https://github.com/rkkr/simple-keyboard), identificado
en `NOTICE.md` como base. Los archivos no enumerados abajo coincidieron con ese
commit. Esta comprobación acredita procedencia técnica respecto al upstream; no
sustituye una revisión jurídica independiente de las contribuciones nuevas.

## Recursos que difieren de la base

| Rutas | Naturaleza y procedencia | Licencia/aviso que se conserva |
|---|---|---|
| `icons/icon.svg`, `icons/ic_launcher-playstore.png` | Aportaciones visuales declaradas por jpi59 en `NOTICE.md`. | GPL-3.0-or-later para la aportación declarada. |
| `drawable/ic_launcher.xml`, `drawable-v26/ic_launcher_foreground.xml`, `drawable-v26/ic_launcher_monochrome.xml` | Adaptación del icono de lanzamiento sobre recursos existentes de Android. | Apache-2.0 de la base; contribución combinada bajo GPL-3.0-or-later. |
| `layout/input_view.xml`, `layout-v28/input_view.xml`, `layout/more_keys_keyboard.xml` | Recursos de interfaz derivados de Simple Keyboard. | Apache-2.0; conservar avisos upstream. |
| `values/attrs.xml`, `values/colors.xml`, `values/icons.xml`, `values/strings.xml`, `values/strings-appname.xml` | Configuración, marca y textos derivados. | Apache-2.0 para material heredado; GPL-3.0-or-later para cambios originales. |
| `values-af`, `values-ar`, `values-b+sr+Latn`, `values-be-rBY`, `values-bg`, `values-bn-rBD`, `values-ca`, `values-cs`, `values-de`, `values-el`, `values-es`, `values-eu-rES`, `values-fa`, `values-fi`, `values-fr`, `values-gl-rES`, `values-hr`, `values-in`, `values-it`, `values-lt`, `values-mk-rMK`, `values-nb`, `values-nl`, `values-pl`, `values-pt`, `values-ro`, `values-ru`, `values-sk`, `values-sr`, `values-tr`, `values-uk`, `values-vi`, `values-zh-rCN`, `values-zh-rTW` (`strings.xml`) | Traducciones o textos de aplicación modificados a partir de los recursos upstream. | Apache-2.0 para texto heredado; GPL-3.0-or-later para cambios originales. |
| `xml/method.xml`, `xml/prefs.xml`, `xml/prefs_screen_appearance.xml`, `xml/prefs_screen_key_press.xml` | Declaración del IME y pantallas de preferencias derivadas. | Apache-2.0; conservar avisos upstream. |

## Límites y mantenimiento

No se incluyen capturas, vídeos ni material promocional de procedencia no
documentada. Antes de incorporar un recurso binario o gráfico nuevo, debe
registrarse aquí su archivo, autor o fuente, licencia, fecha de consulta y las
modificaciones realizadas. Si no se puede verificar su licencia, no debe entrar
en la distribución pública ni en una solicitud a F-Droid.
