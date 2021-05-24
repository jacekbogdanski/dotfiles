local utils = require("utils")

local opts = {silent = true}
utils.nmap("<Leader>ga", ":Git add %<CR><CR>", opts)
utils.nmap("<Leader>gg", ":Git<CR>", opts)
utils.nmap("<Leader>gc", ":Git commit -v -q<CR>", opts)
utils.nmap("<Leader>gq", ":Git commit -v -q %<CR>", opts)
utils.nmap("<Leader>gd", ":Gdiff<CR>", opts)
utils.nmap("<Leader>ge", ":Gedit<CR>", opts)
utils.nmap("<Leader>gr", ":Gread<CR>", opts)
utils.nmap("<Leader>gw", ":Gwrite<CR>", opts)
utils.nmap("<Leader>gm", ":Gmove<CR>", opts)
