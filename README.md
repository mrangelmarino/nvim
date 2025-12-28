# nvim

Modern Neovim configuration using lazy.nvim

## Quick Start

1. Install Neovim (0.9+):
   ```bash
   # macOS
   brew install neovim

   # Ubuntu/Debian
   sudo apt install neovim
   ```

2. Install dependencies:
   ```bash
   # macOS
   brew install ripgrep fd

   # Ubuntu/Debian
   sudo apt install ripgrep fd-find
   ```

3. Clone and set up config:
   ```bash
   git clone https://github.com/mrangelmarino/nvim.git
   ln -s ~/nvim/init.lua ~/.config/nvim/init.lua
   ```

4. Launch Neovim - plugins install automatically:
   ```bash
   nvim
   ```

## Plugins

| Plugin | Purpose |
|--------|---------|
| lazy.nvim | Package manager |
| nvim-tree | File explorer |
| telescope | Fuzzy finder |
| nvim-surround | Surround commands (cs/ds/ys) |
| Comment.nvim | Commenting |
| nvim-treesitter | Syntax highlighting |
| lualine | Status bar |
| gitsigns | Git gutter |
| tokyonight | Color theme |
| nvim-autopairs | Auto brackets |
| vim-fugitive | Git integration |

## Keyboard Shortcuts

Leader key: `;`

### Navigation
| Shortcut | Description |
|----------|-------------|
| `\|` or `;n` | Toggle file explorer |
| `Shift + k` | Next buffer |
| `Shift + j` | Previous buffer |
| `Shift + h` | Move to left window |
| `Shift + l` | Move to right window |
| `j` / `k` | Move by visual line |

### Finding
| Shortcut | Description |
|----------|-------------|
| `;f` | Fuzzy find files |
| `;a` | Live grep (search in files) |
| `;b` | List/search buffers |

### Editing
| Shortcut | Description |
|----------|-------------|
| `cs{(` | Change surrounding {} to () |
| `ds{` | Delete surrounding {} |
| `ys{motion}{char}` | Add surrounding |
| `Space` | Add blank line above |
| `Enter` | Add blank line below |
| `;r` | Redo |
| `Esc Esc` | Clear search highlight |
| Double-click | Highlight all occurrences |

### Comments
| Shortcut | Description |
|----------|-------------|
| `;cc` | Toggle comment line |
| `;cb` | Toggle block comment |

## Settings

- 2-space indentation (spaces, not tabs)
- Line numbers enabled
- Mouse enabled
- Smart case search
- Persistent undo
- Color column at 100
- Auto-strip trailing whitespace
- True color support

## Aliases (add to shell config)

```bash
alias v="nvim"
alias vim="nvim"
```

## iTerm & Karabiner (optional)

For the full terminal experience on macOS:
1. Install SFMono Nerd Font (included in repo)
2. Import iTerm preferences: `com.googlecode.iterm2.plist`
3. Install Karabiner and symlink config:
   ```bash
   ln -s ~/nvim/karabiner ~/.config/karabiner
   ```

## Legacy

The old vim-plug configuration is preserved in `init.vim` for reference.
