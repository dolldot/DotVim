vim.api.nvim_win_set_option(0, "number", true)

local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  termguicolors = true,
  belloff = "all",
  mouse = "a",
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  autoindent = true,
  smartindent = true,
  smarttab = true,
  wrap = true,
  number = true,
  relativenumber = true,
  ruler = true,
  incsearch = true,
  hlsearch = true,
  ignorecase = true,
  splitbelow = true,
  splitright = true,
  backup = false,
  writebackup = false,
  showmode = false,
  cursorline = true,
  laststatus = 2,
  showtabline = 2,
  signcolumn = "yes",
  clipboard = "unnamedplus",
  swapfile = false,
  timeoutlen = 100,
  hidden = true,
  colorcolumn = "120",
  conceallevel = 0,
  completeopt = "menuone,noselect",
  cmdheight = 2,
}

return options
