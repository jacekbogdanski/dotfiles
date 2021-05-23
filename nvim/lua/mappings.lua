local utils = require("utils")

vim.g.mapleader = ','

utils.nmap(";", ":")

utils.nmap("<Leader>s", ":%s//g<Left><Left>")
utils.nmap("<Leader>S", ":%S//g<Left><Left>")

utils.nnoremap("vv", "<C-w>v")
utils.nnoremap("vs", "<C-w>s")
utils.nnoremap("vo", "<C-w>o")
