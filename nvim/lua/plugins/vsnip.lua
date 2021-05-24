local utils = require("utils")

utils.set_options(vim.g, {
	vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets"
})
