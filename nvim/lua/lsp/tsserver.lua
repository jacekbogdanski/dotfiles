local nvim_lsp = require("lspconfig")

nvim_lsp.tsserver.setup {
	root_dir = require('lspconfig/util')
		.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}

nvim_lsp.diagnosticls.setup {
	filetypes = {"javascript", "javascriptreact", "typescript", "typescriptreact", "css"},
	init_options = {
		filetypes = {
			javascript = "eslint",
			typescript = "eslint",
			javascriptreact = "eslint",
			typescriptreact = "eslint"
		},
		linters = {
			eslint = {
				sourceName = "eslint",
				command = "./node_modules/.bin/eslint",
				rootPatterns = {
					".eslitrc.js",
					"package.json"
				},
				debounce = 100,
				args = {
					"--cache",
					"--stdin",
					"--stdin-filename",
					"%filepath",
					"--format",
					"json"
				},
				parseJson = {
					errorsRoot = "[0].messages",
					line = "line",
					column = "column",
					endLine = "endLine",
					endColumn = "endColumn",
					message = "${message} [${ruleId}]",
					security = "severity"
				},
				securities = {
					[2] = "error",
					[1] = "warning"
				}
			}
		}
	}
}
