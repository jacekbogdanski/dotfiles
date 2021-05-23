local utils = require("utils")

utils.nnoremap("<TAB>", ":BufferNext<CR>")
utils.nnoremap("]b", ":BufferNext<CR>")
utils.nnoremap("<S-TAB>", ":BufferPrevious<CR>")
utils.nnoremap("[b", ":BufferPrevious<CR>")
utils.nnoremap("<C-x>", ":BufferClose<CR>")
