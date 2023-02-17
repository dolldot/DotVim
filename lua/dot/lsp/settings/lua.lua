require"lspconfig".lua_ls.setup {
  on_attach = require("dot.lsp.config").on_attach,
  capabilities = require("dot.lsp.config").capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = {
          library = vim.api.nvim_get_runtime_file("", true),
          -- [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          -- [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
    },
  },
}
