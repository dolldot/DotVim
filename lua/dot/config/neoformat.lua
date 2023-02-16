-- Format on save
require("dot.utils").define_augroups {
  autoformat = {
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

vim.g.neoformat_try_node_exe = 1
vim.g.neoformat_run_all_formatters = 0
vim.g.neoformat_enabled_javascript = { "prettier" }

