local utils = require("utils")

function relative_num()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
	else
		vim.wo.relativenumber = true
	end
end

utils.nnoremap("<Leader><Space>", ":lua relative_num()<CR>")
