local utils = require("dot.utils")

utils.define_augroups({
  _custom_default = {
    {
      "TextYankPost",
      "*",
      "lua require('vim.highlight').on_yank({ higroup = 'Search', timeout = 200 })",
    },
  },
})

utils.define_augroups({
  _custom_statusline = {
    {
      "WinEnter",
      "*",
      "setlocal statusline=%!v:lua.Statusline.active()",
    },
    {
      "BufEnter",
      "*",
      "setlocal statusline=%!v:lua.Statusline.active()",
    },
    {
      "WinLeave",
      "*",
      "setlocal statusline=%!v:lua.Statusline.inactive()",
    },
    {
      "BufLeave",
      "*",
      "setlocal statusline=%!v:lua.Statusline.inactive()",
    },
  },
})
