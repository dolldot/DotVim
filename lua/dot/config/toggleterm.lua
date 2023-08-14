local M = {}

local config = {
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  direction = "float",
}

M.setup = function()
  local ok, toggleterm = pcall(require, "toggleterm")
  if not ok then
    return
  end

  toggleterm.setup(config)
end

return M
