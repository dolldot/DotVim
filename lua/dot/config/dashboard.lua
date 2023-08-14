local M = {}

local config = {
  theme = "doom",
  config = {
    header = {
      "",
      "▓█████▄  ▒█████  ▄▄▄█████▓ ██▒   █▓ ██▓ ███▄ ▄███▓",
      "▒██▀ ██▌▒██▒  ██▒▓  ██▒ ▓▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
      "░██   █▌▒██░  ██▒▒ ▓██░ ▒░ ▓██  █▒░▒██▒▓██    ▓██░",
      "░▓█▄   ▌▒██   ██░░ ▓██▓ ░   ▒██ █░░░██░▒██    ▒██ ",
      "░▒████▓ ░ ████▓▒░  ▒██▒ ░    ▒▀█░  ░██░▒██▒   ░██▒",
      " ▒▒▓  ▒ ░ ▒░▒░▒░   ▒ ░░      ░ ▐░  ░▓  ░ ▒░   ░  ░",
      " ░ ▒  ▒   ░ ▒ ▒░     ░       ░ ░░   ▒ ░░  ░      ░",
      " ░ ░  ░ ░ ░ ░ ▒    ░           ░░   ▒ ░░      ░   ",
      "   ░        ░ ░                 ░   ░         ░   ",
      " ░                             ░                  ",
      "",
    },
    center = {
      {
        icon = " ",
        icon_hl = "@variable",
        desc = "Files",
        group = "Label",
        action = "Telescope find_files",
        key = "f",
      },
      {
        icon = " ",
        icon_hl = "@variable",
        desc = "Recently opened files",
        group = "Label",
        action = "Telescope oldfiles",
        key = "r",
      },
      {
        icon = " ",
        icon_hl = "@variable",
        desc = "Find text",
        group = "Label",
        action = "Telescope live_grep",
        key = "t",
      },
    },
    footer = { "!!!Victoria Concordia Crescit!!!" },
  },
  1,
}

M.setup = function()
  local ok, dashboard = pcall(require, "dashboard")
  if not ok then
    return
  end

  vim.cmd [[
    let g:indent_blankline_filetype_exclude = ["dashboard"]
  ]]
  dashboard.setup(config)
end

return M
