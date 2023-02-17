require"lspconfig".terraformls.setup {
  on_attach = require("dot.lsp.config").on_attach,
  capabilities = require("dot.lsp.config").capabilities,
}
