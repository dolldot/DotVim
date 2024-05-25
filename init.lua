vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set up lazy, and load my `lua/dot/plugins/` folder
require("lazy").setup({ import = "dot/plugins" }, { change_detection = { notify = false } })

local utils = require("dot.utils")
local config = utils.create_or_read_config()

vim.cmd.colorscheme(config.colorscheme)
vim.lsp.set_log_level(config.log)

-- -- autoload telescope when opening neovim
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     if vim.fn.argv(0) == "" then
--       require("telescope.builtin").find_files()
--     end
--   end,
-- })
