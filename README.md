# nvim

## Instructions

1. Install iTerm
2. clone repo
3. Install SFMono Nerd Font
4. Apply iTerm preferences saved in repo
  - Set preferences from file but don't save
  - Quit and reopen
5. `brew install neovim`
6. `brew install fd`
7. `brew install the_silver_searcher`
8. Add `source $HOME/{directory}/nvim/init.vim` to `~/.config/nvim/init.vim`
9. `:PlugInstall`
10. Install Karabiner
11. Symlink Karabiner preferences: `ln -s ~/{directory}/nvim/karabiner ~/.config`
12. Restart Karabiner:`launchctl kickstart -k gui/`id -u`/org.pqrs.karabiner.karabiner_console_user_server`
13. Safari sVimrc gist id: `3e0411beaf6f78c3bec04dbeb0e0bf85`
14. Safari sVimcss gist id: `3290e93863886572db5b2305c80227f8`

## Aliases

`alias v="nvim"`
`alias vim="nvim"`

## Keyboard Shortcuts

### Navigation
| Shortcut | Description |
|----------|-------------|
| `\|` or `;n` | Toggle file explorer (NERDTree) |
| `Shift + k` | Next buffer |
| `Shift + j` | Previous buffer |
| `Shift + h` | Move to left window |
| `Shift + l` | Move to right window |

### File Finding
| Shortcut | Description |
|----------|-------------|
| `;f` | Fuzzy find files |
| `;a` | Search in files (requires Ag/Silver Searcher) |
| `;b` | List/search buffers |

### Editing
| Shortcut | Description |
|----------|-------------|
| `cs{(` | Change surrounding {} to () |
| `ds{` | Delete surrounding {} |
| `yss{` | Add {} around line |
| `cp` | Copy to system clipboard |
| `cv` | Paste from system clipboard |
| `Space` | Add blank line before cursor |
| `Enter` | Add blank line after cursor |
| `;r` | Redo |
| Double-click | Highlight all occurrences of word |
| `Esc Esc` | Clear search highlighting |

### Comments
| Shortcut | Description |
|----------|-------------|
| `;cc` | Comment out line(s) |
| `;cu` | Uncomment line(s) |

### Buffer Management
| Command | Description |
|---------|-------------|
| `:BO` | Close all buffers except current one |
| `:BD` | Delete current buffer |

### Other Useful Commands
| Command | Description |
|---------|-------------|
| `:Guides` | Toggle indent guides |
| `:Files` | Fuzzy file finder |
| `:Ag` | Search in files |
| `:Buffers` | List buffers |

> Note: The `;` key is configured as the leader key. For shortcuts starting with `;`, press the semicolon first, then the following key.

### Windows Setup Requirements
- For `;a` (Ag search): Install [Silver Searcher](https://github.com/ggreer/the_silver_searcher)
- For optimal fuzzy finding: Install [fd](https://github.com/sharkdp/fd)
- For system clipboard integration: Ensure proper clipboard support is configured
