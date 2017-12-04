"""""""""""""""
" nvim config
"""""""""""""""

"""""""""""""""
" plugins
"""""""""""""""
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" behavior
Plug 'scrooloose/nerdtree' " :NERDTree
Plug 'tpope/vim-surround'  " cs{( ds{ yss{
Plug 'christoomey/vim-system-copy' " cp cv
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fubitive'
Plug 'kablamo/vim-git-log'
Plug 'tpope/vim-rhubarb'
Plug 'qpkorr/vim-bufkill'
Plug 'schickling/vim-bufonly'

" syntax
Plug 'vim-syntastic/syntastic'
Plug 'othree/yajs.vim'
Plug 'leshill/vim-json'
Plug 'heavenshell/vim-jsdoc'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'nelsyeung/twig.vim'

" appearance
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'nathanaelkane/vim-indent-guides'

" theme
Plug 'tyrannicaltoucan/vim-quantum'

call plug#end()


"""""""""""""""
" behavior
"""""""""""""""
set history=500
set gdefault
set smartcase
set ignorecase
set mouse=a
set fileencoding=utf-8
set encoding=utf8
set pumheight=30
set sessionoptions-=buffers,tabpages
set hidden
let $FZF_DEFAULT_COMMAND = 'fd --type f --exclude .git'
set autoindent

" auto-open NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif

" NERDTree toggle
nnoremap \| :NERDTreeToggle<CR>

let g:NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1

" persistent undo
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" move between buffers
nnoremap <S-k> :bnext<CR>
nnoremap <S-j> :bprevious<CR>

" make moving between windows easier
nnoremap <S-h> <C-w>h
nnoremap <S-l> <C-w>l

" close all other buffers except the one you're on
if empty(":BO")
  :command BO BufOnly
endif

" map j/k to gk/gj to move around visual lines
nnoremap <buffer> <silent> j gj
nnoremap <buffer> <silent> k gk

" map jk to esc in insert mode
:imap jk <Esc>

" map fuzzy finder
nnoremap <S-f> :Files<CR>
nnoremap <S-t> :Ag<CR>

" highlight occurences on double click
:map <2-LeftMouse> *
nnoremap <silent> <Esc><Esc> :noh<CR>

" eslint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"""""""""""""""
" appearance
"""""""""""""""
set number
set noshowmode
set gcr=a:blinkon500-blinkwait500-blinkoff500
set cursorline
set showmatch
set wrap
set linebreak
set listchars=tab:│·,trail:·,extends:→
set list
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter= 'unique_tail_improved'
let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree=1
let g:webdevicons_enable_airline_tabline=1
let g:webdevicons_enable_airline_statusline=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" indentation
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set nofoldenable
set colorcolumn=100
if empty(":Guides")
  :command Guides IndentGuidesToggle
endif

"""""""""""""""
" theme
"""""""""""""""
set background=dark
set termguicolors
let g:quantum_black=1
let g:quantum_italics=1
let g:airline_theme='quantum'
colorscheme quantum
