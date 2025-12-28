--------------------------------------------------------------------------------
-- Neovim Configuration with lazy.nvim
--------------------------------------------------------------------------------

-- Leader key (must be set before lazy.nvim)
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

--------------------------------------------------------------------------------
-- Bootstrap lazy.nvim
--------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--------------------------------------------------------------------------------
-- Plugins
--------------------------------------------------------------------------------
require("lazy").setup({
  -- File explorer (replaces NERDTree)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
        },
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        filters = {
          dotfiles = false,
        },
      })
    end,
  },

  -- Fuzzy finder (replaces fzf.vim)
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { ".git/" },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })
    end,
  },

  -- Surround commands (cs/ds/ys)
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- Commenting (replaces nerdcommenter)
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        padding = true,
        sticky = true,
        toggler = {
          line = "<leader>cc",
          block = "<leader>cb",
        },
        opleader = {
          line = "<leader>c",
          block = "<leader>b",
        },
      })
    end,
  },

  -- Treesitter (syntax highlighting)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "javascript",
          "typescript",
          "tsx",
          "json",
          "html",
          "css",
          "markdown",
          "bash",
          "python",
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },

  -- Status line (replaces airline)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          section_separators = "",
          component_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        tabline = {
          lualine_a = { "buffers" },
          lualine_z = { "tabs" },
        },
      })
    end,
  },

  -- Git signs (replaces gitgutter)
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
      })
    end,
  },

  -- Theme (tokyonight, similar dark feel to quantum)
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
        },
      })
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Git integration
  { "tpope/vim-fugitive" },
})

--------------------------------------------------------------------------------
-- Editor Settings
--------------------------------------------------------------------------------
local opt = vim.opt

-- Indentation (2-space, spaces not tabs)
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Line numbers
opt.number = true

-- Mouse enabled
opt.mouse = "a"

-- Search
opt.smartcase = true
opt.ignorecase = true
opt.gdefault = true

-- Persistent undo
opt.undofile = true
opt.undodir = vim.fn.expand("~/.config/nvim/backups")
vim.fn.mkdir(vim.fn.expand("~/.config/nvim/backups"), "p")

-- Color column at 100
opt.colorcolumn = "100"

-- Enable termguicolors
opt.termguicolors = true

-- Other appearance settings
opt.cursorline = true
opt.showmatch = true
opt.wrap = true
opt.linebreak = true
opt.showmode = false
opt.list = true
opt.listchars = { tab = "│·", trail = "·", extends = "→" }

-- Buffer/window behavior
opt.hidden = true
opt.pumheight = 30
opt.history = 500
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Folding (disabled by default like original)
opt.foldmethod = "indent"
opt.foldenable = false
opt.foldlevelstart = 99

--------------------------------------------------------------------------------
-- Keybindings
--------------------------------------------------------------------------------
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- File tree toggle: | or ;n
keymap("n", "|", ":NvimTreeToggle<CR>", opts)
keymap("n", "<Leader>n", ":NvimTreeToggle<CR>", opts)

-- Buffer navigation: Shift+j/k
keymap("n", "<S-k>", ":bnext<CR>", opts)
keymap("n", "<S-j>", ":bprevious<CR>", opts)

-- Window navigation: Shift+h/l
keymap("n", "<S-h>", "<C-w>h", opts)
keymap("n", "<S-l>", "<C-w>l", opts)

-- Telescope: fuzzy find, grep, buffers
keymap("n", "<Leader>f", ":Telescope find_files<CR>", opts)
keymap("n", "<Leader>a", ":Telescope live_grep<CR>", opts)
keymap("n", "<Leader>b", ":Telescope buffers<CR>", opts)

-- Redo
keymap("n", "<Leader>r", "<C-r>", opts)

-- Clear search highlight: Esc Esc
keymap("n", "<Esc><Esc>", ":noh<CR>", opts)

-- Insert blank line above (Space)
keymap("n", "<Space>", "moO<Esc>`ok", opts)

-- Insert blank line below (Enter)
keymap("n", "<CR>", "moo<Esc>`oj", opts)

-- Move by visual line (gj/gk)
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("v", "j", "gj", opts)
keymap("v", "k", "gk", opts)
keymap("n", "<Down>", "gj", opts)
keymap("n", "<Up>", "gk", opts)
keymap("v", "<Down>", "gj", opts)
keymap("v", "<Up>", "gk", opts)
keymap("i", "<Down>", "<C-o>gj", opts)
keymap("i", "<Up>", "<C-o>gk", opts)

-- Highlight occurrences on double click
keymap("n", "<2-LeftMouse>", "*", opts)

--------------------------------------------------------------------------------
-- Autocommands
--------------------------------------------------------------------------------
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Strip trailing whitespace on save
augroup("TrimWhitespace", { clear = true })
autocmd("BufWritePre", {
  group = "TrimWhitespace",
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Open nvim-tree on startup if no file specified
augroup("NvimTreeAutoOpen", { clear = true })
autocmd("VimEnter", {
  group = "NvimTreeAutoOpen",
  callback = function()
    if vim.fn.argc() == 0 then
      require("nvim-tree.api").tree.open()
    end
  end,
})
