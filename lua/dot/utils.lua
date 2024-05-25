local utils = {}
local config_path = vim.fn.stdpath("data") .. "/dot-config.json"
local default_config = {
  colorscheme = "catppuccin",
  log = "off",
}

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
  vim.api.nvim_create_autocmd(hl_events, {
    group = group,
    buffer = bufnr,
    callback = vim.lsp.buf.document_highlight,
  })
  vim.api.nvim_create_autocmd("CursorMoved", {
    group = group,
    buffer = bufnr,
    callback = vim.lsp.buf.clear_references,
  })
end

function utils.set_options(options)
  for k, v in pairs(options) do
    vim.api.nvim_set_option_value(k, v, { scope = "global" })
  end
end

-- dynamic mode mapping
function utils.set_keymapd(modes, key, func, desc)
  local description = desc or ""
  local opts = { noremap = true, silent = true, desc = description }
  for _, v in ipairs(modes) do
    vim.keymap.set(v, key, func, opts)
  end
end

-- normal mode mapping
function utils.set_keymapn(key, func, desc)
  local description = desc or ""
  local default_opts = { noremap = true, silent = true, desc = description }
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
  local default_opts = { noremap = true, silent = true, buffer = true }
  vim.keymap.set("t", key, func, default_opts)
end

-- read a file

local function read_file(path)
  local fd = assert(io.open(path, "r"))
  local data = fd:read("*a")
  fd:close()
  return data
end

-- write to a file
local function write_file(path, contents)
  local fd = assert(io.open(path, "w+"))
  fd:write(contents)
  fd:close()
end

-- create or read config file
function utils.create_or_read_config()
  local check_file = io.open(config_path, "r")
  if check_file == nil then
    write_file(config_path, vim.json.encode(default_config))
  end

  return vim.json.decode(read_file(config_path))
end

-- set the current applied colorscheme
function utils.set_colorscheme()
  local current_colorscheme = vim.g.colors_name
  local config = utils.create_or_read_config()
  config.colorscheme = current_colorscheme
  write_file(config_path, vim.json.encode(config))
end

-- toggle log between error and off
function utils.toggle_log()
  local config = utils.create_or_read_config()
  if config.log == "error" then
    config.log = "off"
  else
    config.log = "error"
  end
  write_file(config_path, vim.json.encode(config))
end

return utils
