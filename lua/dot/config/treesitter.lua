local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    files = { "src/parser.c", "src/scanner.cc" },
    branch = "main",
  },
}

parser_configs.norg_meta = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
    files = { "src/parser.c" },
    branch = "main",
  },
}

parser_configs.norg_table = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
    files = { "src/parser.c" },
    branch = "main",
  },
}

configs.setup {
  ensure_installed = { "bash", "css", "dockerfile", "go", "html", "javascript", "json", "lua", "python", "terraform", "tsx", "typescript", "vim", "yaml"},
  sync_install = false,
  ignore_install = { "" },
  autopairs = { enable = true },
  highlight = { enable = true, disable = { "" } },
  indent = { enable = false, disable = { "yaml" } },
  context_commentstring = { enable = true, enable_autocmd = false },
}
