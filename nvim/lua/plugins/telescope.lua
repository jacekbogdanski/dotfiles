local utils = require("utils")
local actions = require("telescope.actions")

require("telescope").setup {
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},

			n = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			}
		}
	}
}

utils.nnoremap("<C-p>", ':lua require("telescope.builtin").find_files()<cr>')
utils.nnoremap("<C-g>", ':lua require("telescope.builtin").live_grep()<cr>')
