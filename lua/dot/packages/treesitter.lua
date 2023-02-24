local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

configs.setup {
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "norg",
    "norg_meta",
    "python",
    "terraform",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
  sync_install = false,
  ignore_install = { "" },
  autopairs = { enable = true },
  highlight = { enable = true, disable = { "" } },
  indent = { enable = false, disable = { "yaml" } },
  context_commentstring = { enable = true, enable_autocmd = false },
}
