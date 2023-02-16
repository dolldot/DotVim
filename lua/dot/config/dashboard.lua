local ok, dashboard = pcall(require, "dashboard")
if not ok then
  return
end

dashboard.setup {
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
