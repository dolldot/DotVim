local config = {}

function config.init()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local opts = {
    virtual_text = false,
    signs = { active = signs },
    update_in_insert = true,
    severity_sort = true,
    float = { focusable = true, style = "minimal", border = "rounded", source = "always", header = "", prefix = "" },
  }

  vim.diagnostic.config(opts)
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
end

local function lsp_keymap(bufnr)
  local kmap = vim.keymap.set
  local opts = { noremap = true, silent = true, buffer = bufnr }
  kmap("n", "gD", vim.lsp.buf.declaration, opts)
  kmap("n", "gd", vim.lsp.buf.definition, opts)
  kmap("n", "K", vim.lsp.buf.hover, opts)
  kmap("n", "gr", vim.lsp.buf.references, opts)
  kmap("n", "gi", vim.lsp.buf.implementation, opts)
  kmap("n", "gl", vim.diagnostic.open_float, opts)
end

function config.on_attach(client, bufnr)
  lsp_keymap(bufnr)
  if client.server_capabilities.document_highlight then
    require("dot.core.utils").setup_document_highlight(bufnr)
  end
end

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
  return
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
config.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return config
