local utils = require("utils")

require("nvim-treesitter.configs").setup {
	ensure_installed = "maintained",
	autotag = {
		enable = true
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true
	},
	incremental_selection = {enable = true}
}

utils.set_options(vim.wo, {
	foldlevel = 20,
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()"
})
