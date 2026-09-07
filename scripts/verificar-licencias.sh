#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2026 jpi59

set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

required_files=(
  LICENSE
  LICENSE-APACHE-2.0
  NOTICE.md
  CONTRIBUCIONES-JPI59.md
  AUDITORIA-LICENCIAS-ETHIC-KEYBOARD.md
)

for file in "${required_files[@]}"; do
  [[ -f "$repo_root/$file" ]] || {
    printf 'ERROR: falta el archivo de licencia/procedencia: %s\n' "$file" >&2
    exit 1
  }
done

grep -Fq 'GNU GENERAL PUBLIC LICENSE' "$repo_root/LICENSE" || {
  printf 'ERROR: LICENSE no contiene el texto GPLv3 esperado.\n' >&2
  exit 1
}
grep -Fq 'Apache License' "$repo_root/LICENSE-APACHE-2.0" || {
  printf 'ERROR: falta la copia de Apache 2.0.\n' >&2
  exit 1
}
grep -Fq 'CONTRIBUCIONES-JPI59.md' "$repo_root/NOTICE.md" || {
  printf 'ERROR: NOTICE.md no enlaza el inventario de contribuciones.\n' >&2
  exit 1
}

printf 'OK: GPLv3, Apache 2.0 y documentación de procedencia presentes.\n'
