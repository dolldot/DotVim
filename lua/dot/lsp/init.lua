local ok, _ = pcall(require, "lspconfig")
if not ok then
  return
end

require("dot.lsp.handlers").setup()
require("dot.lsp.settings")
