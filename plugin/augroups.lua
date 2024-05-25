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
