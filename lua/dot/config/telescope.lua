local M = {}

local config = { defauts = { color_devicons = true, selection_caret = "" } }

M.setup = function()
  local ok, telescope = pcall(require, "telescope")
  if not ok then
    return
  end

  telescope.setup(config)
end

return M
