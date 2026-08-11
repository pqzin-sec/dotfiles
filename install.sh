#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

find "$DOTFILES_DIR" -name "install.sh" -exec chmod +x {} \;

"$DOTFILES_DIR/packages/install.sh"
"$DOTFILES_DIR/zsh/install.sh"
"$DOTFILES_DIR/tools/install.sh"
"$DOTFILES_DIR/iterm2/install.sh"
"$DOTFILES_DIR/vscode/install.sh"

echo "==> Dotfiles configurados"