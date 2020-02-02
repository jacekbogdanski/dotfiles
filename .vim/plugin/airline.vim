let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

call airline#parts#define_function('coc_status', 'coc#status')
let g:airline_section_y = airline#section#create_right(['coc_status','ffenc'])
