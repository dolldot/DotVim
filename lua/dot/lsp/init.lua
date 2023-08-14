local M = {}

function M.setup()
  local lspz_ok, lsp = pcall(require, "lsp-zero")
  if not lspz_ok then
    return
  end

  lsp.preset({ manage_nvim_cmp = { set_basic_mappings = true } })

  lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
  end)

  -- (Optional) Configure lua language server for neovim
  require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

  lsp.setup()

  require("dot.lsp.config").diagnostic()
  require("dot.lsp.config").cmp()
end

return M
