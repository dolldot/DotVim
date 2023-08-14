local opts = {
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

-- require"lspconfig".lua_ls.setup(opts)
return opts
