local utils = {}

function utils.define_augroups(definitions)
  for group, definition in pairs(definitions) do
    vim.api.nvim_create_augroup(group, { clear = false })

    for _, item in pairs(definition) do
      vim.api.nvim_create_autocmd(item[1], { group = group, pattern = item[2], command = item[3] })
    end
  end
end

function utils.setup_document_highlight(bufnr)
  local group = "lsp_document_highlight"
  vim.api.nvim_create_augroup(group, { clear = false })

  local hl_events = { "CursorHold", "CursorHoldI" }
  vim.api.nvim_create_autocmd(hl_events, { group = group, buffer = bufnr, callback = vim.lsp.buf.document_highlight })
  vim.api.nvim_create_autocmd("CursorMoved", { group = group, buffer = bufnr, callback = vim.lsp.buf.clear_references })
end

function utils.set_options(options)
  for k, v in pairs(options) do
    vim.api.nvim_set_option(k, v)
  end
end

-- normal mode mapping
function utils.set_keymapn(key, func)
  local default_opts = { noremap = true, silent = true }
  vim.keymap.set("n", key, func, default_opts)
end

-- visual and select mode mapping
function utils.set_keymapv(key, func)
  local default_opts = { noremap = true, silent = true }
  vim.keymap.set("v", key, func, default_opts)
end

-- visual mode mapping
function utils.set_keymapx(key, func)
  local default_opts = { noremap = true, silent = true }
  vim.keymap.set("x", key, func, default_opts)
end

-- terminal mode mapping
function utils.set_keymapt(key, func)
  local default_opts = { noremap = true, silent = true, buffer = 0 }
  vim.keymap.set("t", key, func, default_opts)
end

return utils
