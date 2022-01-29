local utils = require("utils")

require( "nvim-tree").setup {
	auto_close = true,
	hijack_netrw = true,
	disable_netrw = false,
	git = {
		enable = true,
		ignore = true
	},
	diagnostics = {
		enable = true
	},
	filters = {
		dotfiles = true
	}
}

utils.nnoremap("<C-n>", ":NvimTreeToggle<CR>")
utils.nnoremap("<Leader>n", ":NvimTreeFindFile<CR>")
