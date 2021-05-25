local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

npairs.setup({
	check_ts = true,
	ts_config = {
		lua = {"string"}, -- it will not add pair on that treesitter node
		javascript = {"template_string"}
	}
})

npairs.add_rules {
	Rule(' ', ' ')
	:with_pair(function (opts)
		local pair = opts.line:sub(opts.col, opts.col + 1)
		return vim.tbl_contains({ '()', '[]', '{}' }, pair)
	end)
}

vim.g.completion_confirm_key = ""

function completion_confirm()
	if vim.fn.pumvisible() ~= 0  then
		if vim.fn.complete_info()["selected"] ~= -1 then
			return vim.fn["compe#confirm"](npairs.esc("<cr>"))
		else
			return npairs.esc("<cr>")
		end
	else
		return npairs.autopairs_cr()
	end
end

vim.api.nvim_set_keymap('i' , '<CR>','v:lua.completion_confirm()', {expr = true , noremap = true})
