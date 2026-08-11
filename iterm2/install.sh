#!/usr/bin/env bash

set -euo pipefail

ITERM2_DIR="$(cd "$(dirname "$0")" && pwd)"
DYNAMIC_PROFILES_DIR="$HOME/Library/Application Support/iTerm2/DynamicProfiles"

echo "==> Configurando iTerm2"

mkdir -p "$DYNAMIC_PROFILES_DIR"

ln -sfn \
  "$ITERM2_DIR/Profiles.json" \
  "$DYNAMIC_PROFILES_DIR/Profiles.json"

echo "==> iTerm2 configurado"