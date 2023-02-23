local utils = require("dot.core.utils")

utils.define_augroups {
  _default_settings = {
    { "TextYankPost", "*", "lua require('vim.highlight').on_yank({ higroup = 'Search', timeout = 200 })" },
    { "BufWinEnter", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" },
    { "BufRead", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" },
    { "BufNewFile", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" },
  },
  -- Format on save
  _autoformat = {
    {
      "BufWritePre",
      "*.lua",
      [[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]],
    },
    {
      "BufWritePre",
      "*.go",
      [[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]],
    },
    {
      "BufWritePre",
      "*.js",
      [[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]],
    },
    {
      "BufWritePre",
      "*.jsx",
      [[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]],
    },
  },
}

local options = require("dot.core.options")
utils.set_options(options)
