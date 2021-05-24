local utils = require("utils")

utils.set_options(vim.g, {
	indent_blankline_char = "│",
	indent_blankline_use_treesitter = true,
	indent_blankline_show_trailing_blankline_indent = false
})
