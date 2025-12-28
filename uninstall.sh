#!/bin/bash
set -e

echo "Uninstalling neovim config..."

# Remove symlink
if [[ -L ~/.config/nvim/init.lua ]]; then
  rm ~/.config/nvim/init.lua
  echo "Removed ~/.config/nvim/init.lua symlink"
fi

# Remove empty nvim config dir
if [[ -d ~/.config/nvim ]] && [[ -z "$(ls -A ~/.config/nvim)" ]]; then
  rmdir ~/.config/nvim
  echo "Removed empty ~/.config/nvim directory"
fi

# Ask about plugin data
read -p "Remove lazy.nvim plugin data (~/.local/share/nvim)? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  rm -rf ~/.local/share/nvim
  echo "Removed plugin data"
fi

# Ask about undo history
read -p "Remove persistent undo history (~/.config/nvim/backups)? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  rm -rf ~/.config/nvim/backups
  echo "Removed undo history"
fi

# Restore backup if exists
if [[ -d ~/.config/nvim.bak ]]; then
  read -p "Restore previous config from ~/.config/nvim.bak? [y/N] " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    mv ~/.config/nvim.bak ~/.config/nvim
    echo "Restored previous config"
  fi
fi

echo "Done!"
