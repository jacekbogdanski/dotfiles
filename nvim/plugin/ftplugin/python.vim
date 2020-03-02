set nowrap

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

vmap <F5> :call PyRun()<CR>
nmap <F5> :!python3 %<CR>

fu PyRun() range
	echo system('python3 -c ' . shellescape(join(getline(a:firstline, a:lastline), "\n")))
endf


let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers = ['autopep8', 'yapf']
let b:ale_warn_about_trailing_whitespace = 0
