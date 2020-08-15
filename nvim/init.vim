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
Plug 'junegunn/vim-peekaboo'
Plug 'sheerun/vim-polyglot'
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
Plug 'jszakmeister/vim-togglecursor'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-vinegar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'cespare/vim-toml'
Plug 'AndrewRadev/linediff.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'editorconfig/editorconfig-vim'
Plug 'matze/vim-move'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-test/vim-test'
Plug 'benmills/vimux'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

filetype plugin indent on
syntax enable

set shell=/bin/zsh

let g:nord_italic=1
colorscheme nord

set autowrite

set swapfile " All swap files in tmp folder
set dir=~/.vim/tmp

set backupdir=~/.vim/backup

" set undo for persistent files
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

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set numberwidth=5
set formatoptions-=o    " Continue comment marker in new lines.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

set conceallevel=2

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
	set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
	set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

set foldmethod=indent
set foldlevel=99

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.

set hidden              " Hide current buffer when switching between buffers

set autoread

set clipboard=unnamedplus

set diffopt+=vertical

set cursorline

set list lcs=tab:\¦\ 

let mapleader = ','

nnoremap ; :

nmap <silent> <C-x> :bd<CR>
nmap <silent> <C-S-x> :bd!<CR>
nmap <silent> <C-s> :w<CR>

nmap <Leader>s :%s//g<Left><Left>
nmap <Leader>S :%S//g<Left><Left>
nmap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
