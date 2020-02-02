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
nmap <Leader>; :call NumberToggle()<cr>
