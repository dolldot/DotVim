local M = {}

local config = {
  options = {
    icons_enabled = true,
    -- theme = "solarized_dark",
    -- section_separators = { left = "", right = "" },
    -- component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
      },
      "encoding",
      "filetype",
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = { { "filename", path = 1 } },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  },
  -- tabline = {},
  extensions = {},
}

M.setup = function()
  local status, lualine = pcall(require, "lualine")
  if (not status) then
    return
  end

  lualine.setup(config)
end

return M
