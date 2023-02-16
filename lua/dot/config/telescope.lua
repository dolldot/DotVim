local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defauts = {
    color_devicons = true,
    selection_caret = "",
    mappings = { n = { ["q"] = actions.close } },
  },
}
