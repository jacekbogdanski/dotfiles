local utils = require("utils")

utils.set_options(vim.g, {
	nvim_tree_lsp_diagnostics = 1,
	nvim_tree_gitignore = 1,
	nvim_tree_auto_open = 1,
	nvim_tree_auto_close = 1,
	nvim_tree_hide_dotfiles = 1,
	nvim_tree_indent_markers = 1,
	nvim_tree_follow = 1,
})

utils.nnoremap("<C-n>", ":NvimTreeToggle<CR>")
utils.nnoremap("<Leader>n", ":NvimTreeFindFile<CR>")
