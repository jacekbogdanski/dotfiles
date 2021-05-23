local utils = require("utils")

vim.g.tmux_navigator_no_mappings = 1

utils.nnoremap("<C-h>", ":TmuxNavigateLeft<CR>")
utils.nnoremap("<C-j>", ":TmuxNavigateDown<CR>")
utils.nnoremap("<C-k>", ":TmuxNavigateUp<CR>")
utils.nnoremap("<C-l>", ":TmuxNavigateRight<CR>")
