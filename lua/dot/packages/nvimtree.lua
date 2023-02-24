local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  return
end

nvim_tree.setup {
  open_on_setup = false,
  update_cwd = true,
  update_focused_file = { enable = true, update_cwd = true },
  diagnostics = { enable = false },
  filters = { dotfiles = false, custom = { ".git", "node_modules", ".cache" } },
  git = { enable = true, ignore = true, timeout = 500 },
  view = {
    width = 30,
    hide_root_folder = false,
    side = "left",
    mappings = { custom_only = false, list = { { key = "s", action = "" } } },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  trash = { cmd = "trash", require_confirm = true },
}

local view = require "nvim-tree.view"

local _M = {}
_M.toggle_tree = function()
  if view.is_visible() then
    -- require"nvim-tree".close()
    view.close()
    require"bufferline.api".set_offset(0)
  else
    require"bufferline.api".set_offset(31, "File Explorer")
    -- view.open()
    vim.cmd("NvimTreeToggle")
  end
end

return _M
