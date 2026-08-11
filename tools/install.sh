#!/usr/bin/env bash

set -euo pipefail

TOOLS_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Instalando ferramentas"

if [[ -x "/opt/homebrew/bin/brew" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  pipx ensurepath
fi

while IFS= read -r package; do
  [[ -z "$package" ]] && continue

  if pipx list --short | grep -q "^${package} "; then
    echo "==> $package já está instalado"
  else
    echo "==> Instalando $package"
    pipx install "$package"
  fi
done < "$TOOLS_DIR/tools.txt"

echo "==> Ferramentas configuradas"