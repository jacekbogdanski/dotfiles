" NOTE: this file should be only used for plugins installation, general VIM
" tweaks and common mappings. File type and plugin customizations should be
" placed in corresponding directories according to VIM plugin layout.
"
" Learn more about plugin layout by reading
" https://learnvimscriptthehardway.stevelosh.com/chapters/42.html#plugin-layout-in-the-dark-ages
"
" ----------------------------------------------------------------------------------------
"  PLUGINS INSTALLATION
" ----------------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'tpope/vim-vinegar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'honza/vim-snippets'
Plug 'AndrewRadev/linediff.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'editorconfig/editorconfig-vim'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-test/vim-test'
Plug 'benmills/vimux'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dhruvasagar/vim-table-mode'
Plug 'godlygeek/tabular'

call plug#end()

" ----------------------------------------------------------------------------------------
"  GENERAL TWEAKS
" ----------------------------------------------------------------------------------------

filetype plugin indent on
syntax enable

set shell=/bin/zsh

let g:nord_italic=1
colorscheme nord

set autowrite

set swapfile
set dir=~/.vim/tmp

set backupdir=~/.vim/backup

set undofile
set undodir=~/.vim/undodir
set undolevels=1000
set undoreload=10000

set autoindent
set backspace=indent,eol,start
set complete-=1
set smarttab

set incsearch
set nohls

set showcmd
set showmatch
set showmode
set ruler
set number
set numberwidth=5
set formatoptions-=o
set tabstop=4
set shiftwidth=4

set noerrorbells
set modeline
set linespace=0
set nojoinspaces

set conceallevel=2

set splitbelow
set splitright

if !&scrolloff
	set scrolloff=3
endif
if !&sidescrolloff
	set sidescrolloff=5
endif

set nostartofline

set foldmethod=indent
set foldlevel=99

set ignorecase
set smartcase

set hidden
set autoread

set clipboard=unnamedplus

set diffopt+=vertical

set cursorline

set list lcs=tab:\¦\ 

set spelllang=en_us,pl

" ----------------------------------------------------------------------------------------
"  GENERAL MAPPINGS
" ----------------------------------------------------------------------------------------

let mapleader = ','

nnoremap ; :

nmap <silent> <C-x> :bd<CR>
nmap <silent> <C-S-x> :bd!<CR>
nmap <silent> <C-s> :w<CR>

nmap <Leader>s :%s//g<Left><Left>
nmap <Leader>S :%S//g<Left><Left>
nmap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

nmap <Leader>zz :setlocal spell!<CR>
