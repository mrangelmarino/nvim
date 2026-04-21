# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

Single-file Neovim configuration (`init.lua`) managed with lazy.nvim. The repo lives at `~/nvim` and is symlinked into `~/.config/nvim/init.lua` — edits here are live, no reinstall needed.

## Setup

```bash
./install.sh    # installs neovim/ripgrep/fd, symlinks init.lua
./uninstall.sh  # removes symlink, optionally cleans plugin data
```

Plugins auto-install on first `nvim` launch. No build step, no tests.

## Architecture

Everything is in `init.lua`, organized in this order:

1. **Leader key** — `;` (set before lazy.nvim loads)
2. **Provider disables** — Python/Ruby/Perl/Node providers turned off (all plugins are Lua)
3. **lazy.nvim bootstrap** — auto-clones if missing
4. **Plugin specs** — each plugin declared with inline `config` functions
5. **Editor settings** — indentation (2-space), search, undo, appearance
6. **Keybindings** — custom mappings using `vim.keymap.set`
7. **Autocommands** — trailing whitespace trim, nvim-tree auto-open
8. **LSP** — native `vim.lsp.config` (Neovim 0.11+), currently clangd only

## Key Conventions

- Leader is `;` — all `<Leader>` mappings use semicolon
- 2-space indentation, spaces not tabs
- Persistent undo stored in `~/.config/nvim/backups`
- Trailing whitespace is auto-stripped on save (skips non-modifiable buffers)
- `clipboard = "unnamedplus"` — all yanks/deletes/pastes use the system clipboard
- `init.vim` is the legacy vim-plug config kept for reference — don't modify it

## Intentional (Unusual) Keybindings

These look odd but are deliberate. Don't "clean them up":

- `<BS>` and `<Del>` in normal mode → `dd` (delete line via Mac delete keys)
- `<Space>` in normal mode → insert blank line *above* cursor
- `<CR>` (Enter) in normal mode → insert blank line *below* cursor
- `j`/`k` → `gj`/`gk` (move by visual line, not logical line — matters with wrap)
- `<2-LeftMouse>` → `*` (double-click highlights occurrences)
- `|` → toggle nvim-tree

## Footguns

- **`gdefault = true`** is set. This *inverts* the meaning of `/g` in `:s` commands — substitutions are global by default, and `/g` makes them single-occurrence. If you copy a substitution from docs or another codebase, flip the `/g` or it will behave wrong.

## Theme

The `tokyonight` config uses a custom `on_colors` block to darken backgrounds (near-black `#0c0e14`) and desaturate the syntax palette. This is tuned to match a warm, muted Warp terminal aesthetic — **do not** "simplify" by removing the overrides; the defaults are too blue/bright for this setup.

## LSP

Uses Neovim 0.11+ native LSP (`vim.lsp.config` / `vim.lsp.enable`), not nvim-lspconfig. LSP keybindings are set via `LspAttach` autocommand. To add a new language server, add a `vim.lsp.config.<name>` block and call `vim.lsp.enable("<name>")`.

## Validating Changes

There is no test suite. To verify a change:

- `:source %` inside nvim reloads the current buffer's Lua (fastest feedback loop for editor settings)
- For plugin spec changes, a full `nvim` restart is usually required
- `:checkhealth` surfaces provider/plugin/LSP issues
- `nvim --clean` bypasses config entirely — useful for isolating whether a bug is config-related

If a change can't be verified programmatically, say so rather than claiming it works.

## Other Files

- `install.sh` / `uninstall.sh` — setup scripts (macOS + Debian)
- `settings.json` / `keybindings.json` / `nvim.code-workspace` — legacy VS Code settings; leave alone, don't update
