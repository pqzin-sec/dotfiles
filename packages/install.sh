#!/usr/bin/env bash

set -euo pipefail

PACKAGES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Configurando Homebrew"

if ! command -v brew >/dev/null 2>&1; then
  echo "==> Instalando Homebrew"

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "==> Instalando pacotes"

brew bundle --file="$PACKAGES_DIR/Brewfile"

echo "==> Pacotes configurados"