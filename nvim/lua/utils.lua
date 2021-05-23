local api = vim.api

local M = {}

-- Key mappings
function M.map(type, input, output)
    api.nvim_set_keymap(type, input, output, {})
end

function M.noremap(type, input, output)
    api.nvim_set_keymap(type, input, output, { noremap = true, silent = true })
end

function M.nnoremap(input, output)
    M.noremap('n', input, output)
end

function M.inoremap(input, output)
    M.noremap('i', input, output)
end

function M.vnoremap(input, output)
    M.noremap('v', input, output)
end

function M.tnoremap(input, output)
    M.noremap('t', input, output)
end

function M.nmap(input, output)
	M.map('n', input, output)
end

function M.imap(input, output)
	M.map('i', input, output)
end

function M.vmap(input, output)
	M.map('v', input, output)
end

function M.tmap(input, output)
	M.map('t', input, output)
end

function M.set_options(context, options)
	for key, value in pairs(options) do
		context[key] = value
	end
end

return M
