#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INSTALL_DIR="$HOME/bin"
CONFIG_FILE="$HOME/.config/tabgroup"
ZSH_COMPLETION_DIR="$HOME/.zsh/completions"
TAB_DIR="$HOME/.tabgroup"

# Make sure install dir exists
mkdir -p "$INSTALL_DIR" "$ZSH_COMPLETION_DIR" "$TAB_DIR"

# Copy script
echo "Installing tabgroup to $INSTALL_DIR..."
cp "$SCRIPT_DIR/tabgroup.sh" "$INSTALL_DIR/tabgroup"
chmod +x "$INSTALL_DIR/tabgroup"

# Copy config if not already present
if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "Installing default config to $CONFIG_FILE..."
  cp "$SCRIPT_DIR/config" "$CONFIG_FILE"
else
  echo "Config already exists at $CONFIG_FILE — skipping."
fi

# Copy Zsh completion
echo "Installing zsh completion to $ZSH_COMPLETION_DIR/_tabgroup ..."
cp "$SCRIPT_DIR/zsh_completions" "$ZSH_COMPLETION_DIR/_tabgroup"

# Ensure fpath and compinit are in .zshrc
if ! grep -q 'fpath=(~/.zsh/completions $fpath)' ~/.zshrc; then
  echo 'fpath=(~/.zsh/completions $fpath)' >> ~/.zshrc
fi

if ! grep -q 'compinit' ~/.zshrc; then
  echo 'autoload -Uz compinit && compinit' >> ~/.zshrc
fi

echo "✅ Installation complete. Restart your shell or run: exec zsh"
