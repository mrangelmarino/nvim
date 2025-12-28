#!/bin/bash
set -e

echo "Installing neovim config..."

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
  OS="macos"
elif [[ -f /etc/debian_version ]]; then
  OS="debian"
else
  OS="unknown"
fi

# Install dependencies
echo "Installing dependencies..."
if [[ "$OS" == "macos" ]]; then
  if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Install from https://brew.sh"
    exit 1
  fi
  brew install neovim ripgrep fd
elif [[ "$OS" == "debian" ]]; then
  sudo apt update
  sudo apt install -y neovim ripgrep fd-find
else
  echo "Unknown OS. Please install manually: neovim, ripgrep, fd"
fi

# Backup existing config
if [[ -e ~/.config/nvim/init.lua ]] || [[ -e ~/.config/nvim/init.vim ]]; then
  echo "Backing up existing config to ~/.config/nvim.bak"
  mv ~/.config/nvim ~/.config/nvim.bak
fi

# Create config directory
mkdir -p ~/.config/nvim

# Get script directory (where repo is cloned)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Symlink init.lua
ln -sf "$SCRIPT_DIR/init.lua" ~/.config/nvim/init.lua

echo ""
echo "Done! Run 'nvim' to complete plugin installation."
echo ""
echo "Optional: Add these aliases to your shell config:"
echo '  alias v="nvim"'
echo '  alias vim="nvim"'
