local utils = require("utils")

utils.set_options(vim.g, {
	oceanic_next_terminal_bold = 1,
	oceanic_next_terminal_italic = 1
})

vim.cmd('let g:nvcode_termcolors=256')
vim.cmd("colorscheme OceanicNext")
