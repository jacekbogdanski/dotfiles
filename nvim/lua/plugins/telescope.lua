local utils = require("utils")
local actions = require("telescope.actions")

require("telescope").setup {
	defaults = {
		selection_caret = " ",
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

utils.nnoremap("<C-p>", ':lua require("telescope.builtin").find_files()<CR>')
utils.nnoremap("<C-g>", ':lua require("telescope.builtin").live_grep()<CR>')
utils.nnoremap("<Leader><Leader>", ':lua require("telescope.builtin").buffers()<CR>')

utils.nmap("<Leader>gb", ':lua require("telescope.builtin").git_branches()<CR>')
utils.nmap("<Leader>gl", ':lua require("telescope.builtin").git_commits()<CR>')
utils.nmap("<Leader>gf", ':lua require("telescope.builtin").git_bcommits()<CR>')
