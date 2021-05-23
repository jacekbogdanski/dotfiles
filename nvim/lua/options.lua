local utils = require("utils")

-- Global options
vim.cmd("syntax on")

-- Editor options 
vim.cmd("set iskeyword+=-")
vim.cmd("set shortmess+=c")
vim.cmd("set inccommand=split")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("set diffopt+=vertical")

utils.set_options(vim.o, {
	undofile = true,
	autowrite = true,
	termguicolors = true,
	t_Co = "256",
	pumheight = 10,
	mouse = "a",
	splitbelow = true,
	splitright = true,
	tabstop = 4,
	shiftwidth = 4,
	showtabline = 2,
	showmode = false,
	updatetime = 300,
	clipboard = "unnamedplus",
	smarttab = true,
	hls = false,
	errorbells = false,
	foldmethod = "indent",
	foldlevel = 99,
	ignorecase = true,
	smartcase = true
})

-- Window options
utils.set_options(vim.wo, {
	number = true,
	cursorline = true,
	signcolumn = "yes"
})

-- Buffer options
utils.set_options(vim.bo, {
	smartindent = true
})
