set nowrap

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers = ['autopep8', 'yapf']
let b:ale_warn_about_trailing_whitespace = 0
