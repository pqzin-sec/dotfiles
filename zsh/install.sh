#!/usr/bin/env bash

set -euo pipefail

ZSH_DIR="$(cd "$(dirname "$0")" && pwd)"
ZSH_CONFIG_DIR="$HOME/.config/zsh"
ZSH_CUSTOM_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

echo "==> Configurando Zsh"

command -v git >/dev/null 2>&1 || {
  echo "Erro: git não está instalado."
  exit 1
}

command -v curl >/dev/null 2>&1 || {
  echo "Erro: curl não está instalado."
  exit 1
}

# Instala Oh My Zsh se ainda não existir
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "==> Instalando Oh My Zsh"

  RUNZSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Diretório dos plugins customizados
mkdir -p "$ZSH_CUSTOM_DIR/plugins"

# Plugins externos
[[ -d "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions" ]] || \
  git clone https://github.com/zsh-users/zsh-autosuggestions \
  "$ZSH_CUSTOM_DIR/plugins/zsh-autosuggestions"

[[ -d "$ZSH_CUSTOM_DIR/plugins/fast-syntax-highlighting" ]] || \
  git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  "$ZSH_CUSTOM_DIR/plugins/fast-syntax-highlighting"

[[ -d "$ZSH_CUSTOM_DIR/plugins/you-should-use" ]] || \
  git clone https://github.com/MichaelAquilina/zsh-you-should-use.git \
  "$ZSH_CUSTOM_DIR/plugins/you-should-use"

# Diretório das configurações
mkdir -p "$ZSH_CONFIG_DIR"

# Copia as configurações
cp "$ZSH_DIR/.zshrc" "$HOME/.zshrc"
cp "$ZSH_DIR/aliases.zsh" "$ZSH_CONFIG_DIR/aliases.zsh"
cp "$ZSH_DIR/functions.zsh" "$ZSH_CONFIG_DIR/functions.zsh"
cp "$ZSH_DIR/paths.zsh" "$ZSH_CONFIG_DIR/paths.zsh"

echo "==> Zsh configurado"
echo "Execute: source ~/.zshrc"
