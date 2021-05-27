local utils = require('utils')

utils.nnoremap("gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
utils.nnoremap("gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
utils.nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
utils.nnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
utils.nnoremap("K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
utils.nnoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
utils.nnoremap("<Leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
utils.nnoremap("<Leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
utils.nnoremap("<Leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
utils.nnoremap("<Leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
utils.nnoremap("<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
utils.nnoremap("<Leader>.", "<cmd>lua vim.lsp.buf.code_action()<CR>")
utils.nnoremap("<Leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
utils.nnoremap("[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
utils.nnoremap("]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
utils.nnoremap("<Leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
utils.nnoremap("<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")

vim.fn.sign_define(
    "LspDiagnosticsSignError",
    {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignWarning",
    {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignHint",
    {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"}
)
vim.fn.sign_define(
    "LspDiagnosticsSignInformation",
    {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"}
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      prefix = "",
      spacing = 0,
    },
    signs = true,
    underline = true,
  }
)

vim.lsp.protocol.CompletionItemKind = {
    "   (Text) ",
    "   (Method)",
    "   (Function)",
    "   (Constructor)",
    " ﴲ  (Field)",
    "[] (Variable)",
    "   (Class)",
    " ﰮ  (Interface)",
    "   (Module)",
    " 襁 (Property)",
    "   (Unit)",
    "   (Value)",
    " 練 (Enum)",
    "   (Keyword)",
    "   (Snippet)",
    "   (Color)",
    "   (File)",
    "   (Reference)",
    "   (Folder)",
    "   (EnumMember)",
    " ﲀ  (Constant)",
    " ﳤ  (Struct)",
    "   (Event)",
    "   (Operator)",
    "   (TypeParameter)"
}

local M = {}

function M.common_on_attach(client)
	require("illuminate").on_attach(client)

	-- Highlight groups for illuminate
	vim.api.nvim_command [[ hi def link LspReferenceText CursorLine ]]
	vim.api.nvim_command [[ hi def link LspReferenceWrite CursorLine ]]
	vim.api.nvim_command [[ hi def link LspReferenceRead CursorLine ]]
end

return M
