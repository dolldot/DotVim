-- require("lspconfig").tsserver.setup {
--   filetypes = {
--     "javascript",
--     "javascriptreact",
--     "javascript.jsx",
--     "typescript",
--     "typescriptreact",
--     "typescript.tsx",
--   },
--   on_attach = require("lsp").tsserver_on_attach,
--   root_dir = require("lspconfig/util").root_pattern("package.json",
--                                                     "tsconfig.json",
--                                                     "jsconfig.json", ".git"),
--   settings = { documentFormatting = false },
-- }
-- 
-- require("lsp.settings.efm").setup()
-- 
