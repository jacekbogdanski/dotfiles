
" ----------------------------------------------------------------------------------------
"  PLUGINS INSTALLATION
" ----------------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'elzr/vim-json'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
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
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'

call plug#end()

" ----------------------------------------------------------------------------------------
"  GENERAL TWEAKS
" ----------------------------------------------------------------------------------------

filetype plugin indent on
syntax enable

set shell=/bin/zsh

set termguicolors

let g:onedark_terminal_italics = '1'

colorscheme onedark

set swapfile " All swap files in tmp folder
set dir=~/.vim/tmp

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

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

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

" folding, usage: z-a, z-c, z-o
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.

set hidden              " Hide current buffer when switching between buffers

set diffopt+=vertical   " Diff vertical

set autoread

" Indent tab lines
set list lcs=tab:\•\ 

" ----------------------------------------------------------------------------------------
"  PLUGINS CONFIGURATION
" ----------------------------------------------------------------------------------------

" omnifuncs
augroup omnifuncs
	autocmd!
	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" ternjs
if exists('g:plugs["tern_for_vim"]')
	let g:tern_show_argument_hints = 'on_hold'
	let g:tern_show_signature_in_pum = 1
	autocmd FileType javascript setlocal omnifunc=tern#Complete
	autocmd CompleteDone * pclose
endif

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" airline
let g:airline_theme = 'onedark'
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline#extensions#ale#enabled = 1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'

" ale
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_linters = { 'javascript': ['eslint', 'jshint', 'jscs'] }
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

" closetag
let g:closetag_filenames = '*.html,*.xhtml,*.htm'
let g:closetag_close_shortcut = ''

" nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" git gutter
autocmd BufWinLeave * GitGutterAll

" fzf
" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" ----------------------------------------------------------------------------------------
"  KEY BINDINGS
" ----------------------------------------------------------------------------------------

let mapleader = ','

" Search files
nmap <C-P> :GFiles<CR>
nmap <C-T> :Files<CR>
nmap ; :Buffers<CR>

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> vv <C-w>v
nnoremap <silent> vs <C-w>s
nnoremap <silent> vo <C-w>o

" Buffers
nmap <silent> <C-x> :bd<CR>
nmap <silent> <C-s> :w<CR>

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>
nmap <Leader>S :%S//g<Left><Left>

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nmap <Leader>, :call NumberToggle()<cr>

" Tern
autocmd BufReadPost *.js nmap <buffer> K :TernDoc<CR>
autocmd Filetype javascript nmap <C-T> :TernRefs<CR>
autocmd Filetype javascript nmap <C-]> :TernDef<CR>
autocmd Filetype javascript nmap <Leader>r :TernRename<CR>

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" nerdtree
nmap <Leader>b :NERDTreeToggle<CR>
nmap <Leader>f :NERDTreeFind<CR>

" fugitive
nmap <space>ga :Git add %<CR><CR>
nmap <space>gs :Gstatus<CR>
nmap <space>gc :Gcommit -v -q<CR>
nmap <space>gq :Gcommit -v -q %<CR>
nmap <space>gd :Gdiff<CR>
nmap <space>ge :Gedit<CR>
nmap <space>gr :Gread<CR>
nmap <space>gw :Gwrite<CR><CR>
nmap <space>gm :Gmove<Space>
