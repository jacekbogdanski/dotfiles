local utils = require("utils")

require("nvim-treesitter.configs").setup {
	ensure_installed = "maintained",
	autotag = {
		enable = true
	},
	highlight = {
		enable = true,
		-- additional_vim_regex_highlighting = true
	},
	incremental_selection = {
		enable = true
	},
	autopairs = {
		enable = true
	}
}
