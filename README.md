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
