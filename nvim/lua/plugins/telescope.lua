local utils = require("utils")
local actions = require("telescope.actions")

require("telescope").setup {
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	},
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
		},
		prompt_prefix = "🔎 ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		path_display = { "truncate" },
		winblend = 0,
	}
}

require("telescope").load_extension("fzf")

utils.nnoremap("<C-p>", ':lua require("telescope.builtin").find_files()<CR>')
utils.nnoremap("<C-g>", ':lua require("telescope.builtin").live_grep()<CR>')
utils.nnoremap("<C-t>", ':lua require("telescope.builtin").tags()<CR>')
utils.nnoremap("<Leader><Leader>", ':lua require("telescope.builtin").buffers()<CR>')

utils.nmap("<Leader>gb", ':lua require("telescope.builtin").git_branches()<CR>')
utils.nmap("<Leader>gl", ':lua require("telescope.builtin").git_commits()<CR>')
utils.nmap("<Leader>gf", ':lua require("telescope.builtin").git_bcommits()<CR>')
