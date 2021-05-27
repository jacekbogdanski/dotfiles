-- npm install -g vscode-css-languageserver-bin

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").cssls.setup {
	on_attach = require("lsp").common_on_attach,
	capabilities = capabilities
}
