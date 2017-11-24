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

" syntax
Plug 'othree/yajs.vim'
Plug 'leshill/vim-json'
Plug 'heavenshell/vim-jsdoc'
Plug 'othree/javascript-libraries-syntax.vim'

" appearance
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'airblade/vim-gitgutter'

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
set pumheight=30
set sessionoptions-=buffers,tabpages
set hidden

" auto-open NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" persistent undo
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

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

" indentation
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set nofoldenable
set colorcolumn=80


"""""""""""""""
" theme
"""""""""""""""
set background=dark
set termguicolors
let g:quantum_black=1
let g:quantum_italics=1
let g:airline_theme='quantum'
colorscheme quantum 


