#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2026 jpi59

set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
apk_path="${1:-$repo_root/app/build/outputs/apk/debug/app-debug.apk}"
aapt_path="${AAPT:-aapt}"

if ! command -v "$aapt_path" >/dev/null 2>&1; then
  printf 'ERROR: no se encontró aapt; define AAPT o instala Android Build Tools.\n' >&2
  exit 2
fi

manifest="$repo_root/app/src/main/AndroidManifest.xml"
app_strings="$repo_root/app/src/main/res/values/strings-appname.xml"
if grep -Eq 'android\.permission\.(INTERNET|ACCESS_NETWORK_STATE|ACCESS_WIFI_STATE)' "$manifest"; then
  printf 'ERROR: el manifiesto declara red; requiere revisión ética explícita.\n' >&2
  exit 1
fi

grep -Fq 'https://github.com/jpi59/ethic-keyboard-public/blob/master/PRIVACY_JPI59.md' "$app_strings" || {
  printf 'ERROR: la política de privacidad no apunta al repositorio público.\n' >&2
  exit 1
}
grep -Fq 'https://github.com/jpi59/ethic-keyboard-public/blob/master/LICENSE' "$app_strings" || {
  printf 'ERROR: la licencia no apunta al repositorio público.\n' >&2
  exit 1
}
if grep -Fq 'https://github.com/jpi59/ethic-keyboard/blob/master/' "$app_strings"; then
  printf 'ERROR: quedan enlaces al repositorio no público en la aplicación.\n' >&2
  exit 1
fi

if git -C "$repo_root" grep -n -E 'firebase|admob|analytics|telemetry|crashlytics' -- app/src app/build.gradle >/dev/null 2>&1; then
  printf 'ERROR: se detectó una referencia de telemetría/publicidad en código o build.\n' >&2
  exit 1
fi

if [[ -f "$apk_path" ]]; then
  permissions="$($aapt_path dump permissions "$apk_path")"
  if grep -Eq 'android\.permission\.(INTERNET|ACCESS_NETWORK_STATE|ACCESS_WIFI_STATE)' <<<"$permissions"; then
    printf 'ERROR: el APK contiene un permiso de red.\n' >&2
    exit 1
  fi
  printf 'OK: APK sin permisos de red: %s\n' "$apk_path"
else
  printf 'AVISO: no existe APK; se verificó únicamente el código fuente y el manifiesto.\n'
fi

printf 'OK: política de privacidad mínima superada.\n'
