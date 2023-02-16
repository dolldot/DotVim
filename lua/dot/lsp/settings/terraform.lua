require"lspconfig".terraformls.setup {
  on_attach = require("dot.lsp.handlers").on_attach,
  capabilities = require("dot.lsp.handlers").capabilities,
}
