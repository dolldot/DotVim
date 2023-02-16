require"lspconfig".gopls.setup {
  on_attach = require("dot.lsp.handlers").on_attach,
  capabilities = require("dot.lsp.handlers").capabilities,
  settings = {
    gopls = { analyses = { unusedparams = true }, staticcheck = true },
  },
}
