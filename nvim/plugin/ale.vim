let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_set_highlights = 0

" Use `[c` and `]c` to navigate linting errors
nmap <silent> [c <Plug>(ale_next_wrap)
nmap <silent> ]c <Plug>(ale_previous_wrap)
