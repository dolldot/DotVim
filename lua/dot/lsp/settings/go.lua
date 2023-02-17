require"lspconfig".gopls.setup {
  on_attach = require("dot.lsp.config").on_attach,
  capabilities = require("dot.lsp.config").capabilities,
  settings = { gopls = { analyses = { unusedparams = true }, staticcheck = true } },
}
