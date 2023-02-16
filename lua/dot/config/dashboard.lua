local ok, dashboard = pcall(require, "dashboard")
if not ok then
  return
end

dashboard.setup {
  theme = "doom",
  config = {
    header = {
      "",
      "    ____        ____    __      __     ",
      "   / __ \\____  / / /___/ /___  / /_    ",
      "  / / / / __ \\/ / / __  / __ \\/ __/    ",
      " / /_/ / /_/ / / / /_/ / /_/ / /_      ",
      "/_____/\\____/_/_/\\__,_/\\____/\\__/      ",
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
