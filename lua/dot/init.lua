require("dot.keymappings")
require("dot.bootstrap")
require("dot.plugins")

local utils = require("dot.utils")
local options = require("dot.options")

vim.cmd "colorscheme tokyonight-night"

utils.set_options(options.options)
utils.define_augroups {
  _default_settings = {
    {
      "TextYankPost",
      "*",
      "lua require('vim.highlight').on_yank({ higroup = 'Search', timeout = 200 })",
    },
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
