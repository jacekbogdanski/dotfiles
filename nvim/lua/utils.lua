local api = vim.api

local M = {}

function M.map(mode, input, output, opts)
	opts = opts or {}
	api.nvim_set_keymap(mode, input, output, opts)
end

function M.nmap(input, output, opts)
	M.map('n', input, output, opts)
end

function M.nnoremap(input, output)
	api.nvim_set_keymap("n", input, output, {noremap = true, silent = true })
end

function M.set_options(context, options)
	for key, value in pairs(options) do
		context[key] = value
	end
end

return M
