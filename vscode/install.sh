#!/usr/bin/env bash

set -euo pipefail

VSCODE_DIR="$(cd "$(dirname "$0")" && pwd)"
VSCODE_CONFIG_DIR="$HOME/Library/Application Support/Code/User"

echo "==> Configurando VS Code"

mkdir -p "$VSCODE_CONFIG_DIR"

# Copia as configurações
cp "$VSCODE_DIR/settings.json" "$VSCODE_CONFIG_DIR/settings.json"

# Localiza o comando do VS Code
if command -v code >/dev/null 2>&1; then
  CODE_BIN="$(command -v code)"
elif [[ -x "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ]]; then
  CODE_BIN="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
else
  echo "Erro: VS Code não encontrado."
  exit 1
fi

echo "==> Instalando extensões"

while IFS= read -r extension; do
  [[ -z "$extension" ]] && continue
  [[ "$extension" == \#* ]] && continue

  if "$CODE_BIN" --list-extensions | grep -Fxq "$extension"; then
    echo "==> $extension já está instalada"
  else
    echo "==> Instalando $extension"
    "$CODE_BIN" --install-extension "$extension"
  fi
done < "$VSCODE_DIR/extensions.txt"

echo "==> VS Code configurado"
