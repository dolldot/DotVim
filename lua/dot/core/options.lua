local cmd = vim.cmd
-- local opt = vim.opt

--- TRANSPARENT BACKGROUND ---
-- cmd "au ColorScheme * hi Normal ctermbg=none guibg=none"
-- cmd "au ColorScheme * hi SignColumn ctermbg=none guibg=none"

--- COLORSCHEME ---
-- cmd "colorscheme darkplus"
cmd "colorscheme tokyonight-night"

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

-- opt.shortmess:append "c"

-- for k, v in pairs(options) do
--   vim.opt[k] = v
-- end

return options
