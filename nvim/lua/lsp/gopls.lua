-- go get golang.org/x/tools/gopls@latest
require("lspconfig").gopls.setup{
	on_attach = require("lsp").common_on_attach
}
