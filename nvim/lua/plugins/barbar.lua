local utils = require("utils")

utils.nnoremap("<TAB>", ":BufferNext<CR>")
utils.nnoremap("<S-TAB>", ":BufferPrevious<CR>")
utils.nnoremap("<S-x>", ":BufferClose<CR>")
