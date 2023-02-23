local utils = {}

function utils.define_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.cmd("augroup " .. group_name)
    vim.cmd "autocmd!"

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
      vim.cmd(command)
    end

    vim.cmd "augroup END"
  end
end

function utils.setup_document_highlight(bufnr)
  local group = "lsp_document_highlight"
  vim.api.nvim_create_augroup(group, { clear = false })

  local hl_events = { "CursorHold", "CursorHoldI" }
  vim.api.nvim_create_autocmd(hl_events, { group = group, buffer = bufnr, callback = vim.lsp.buf.document_highlight })
  vim.api.nvim_create_autocmd("CursorMoved", { group = group, buffer = bufnr, callback = vim.lsp.buf.clear_references })
end

utils.define_augroups {
  _general_settings = {
    { "TextYankPost", "*", "lua require('vim.highlight').on_yank({ higroup = 'Search', timeout = 200 })" },
    { "BufWinEnter", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" },
    { "BufRead", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" },
    { "BufNewFile", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" },
  },
}

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
