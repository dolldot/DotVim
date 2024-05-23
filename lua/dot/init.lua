require("dot.keymappings")
require("dot.bootstrap")
require("dot.plugins")

local utils = require("dot.utils")
local options = require("dot.options")

-- vim.cmd "colorscheme tokyonight-night"
vim.cmd "colorscheme catppuccin-mocha"

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
  _removeindent_o = {
    { "BufWinEnter", "*.yaml", "setlocal indentkeys-=o" },
    { "BufRead", "*.yaml", "setlocal indentkeys-=o" },
    { "BufNewFile", "*.yaml", "setlocal indentkeys-=o" },
  },
  _removeindent_dash = {
    { "BufWinEnter", "*.yaml", "setlocal indentkeys-=0-" },
    { "BufRead", "*.yaml", "setlocal indentkeys-=0-" },
    { "BufNewFile", "*.yaml", "setlocal indentkeys-=0-" },
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
    {
      "BufWritePre",
      "*.yaml",
      [[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]],
    },
    {
      "BufWritePre",
      "*.tf",
      [[try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry]],
    },
  },
}
