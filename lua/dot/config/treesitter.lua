local M = {}

local config = {
  ensure_installed = {
    "lua",
    "yaml",
    "terraform",
    "go",
    "python",
    "regex",
    "markdown",
    "markdown_inline",
  },
  sync_install = false,
  auto_install = true,
  ignore_install = {},
  highlight = { enable = true },
  indent = { enable = true, disable = { "yaml" } },
}

M.setup = function()
  local ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
  if not ok then
    return
  end

  treesitter_config.setup(config)
end

return M
