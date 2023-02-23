local utils = require("dot.core.utils")
local nmap = utils.set_keymapn
local vmap = utils.set_keymapv
local xmap = utils.set_keymapx
local tmap = utils.set_keymapt

-- Set leader key
nmap("<Space>", "<NOP>")
vim.g.mapleader = " "

-- Window movement
nmap("sh", "<C-w>h")
nmap("sk", "<C-w>k")
nmap("sj", "<C-w>j")
nmap("sl", "<C-w>l")

-- Split window
nmap("ss", ":split<Return><C-w>w")
nmap("sv", ":vsplit<Return><C-w>w")

-- Buffer navigation
nmap("s>", "<cmd>BufferNext<CR>")
nmap("s<", "<cmd>BufferPrevious<CR>")
nmap("sc", "<cmd>BufferClose<CR>")

-- Indentation
vmap("<", "<gv")
vmap(">", ">gv")

-- Move selected line /block of text in visual mode
xmap("K", ":move '<-2<CR>gv-gv'")
xmap("J", ":move '>+1<CR>gv-gv'")

-- Toggle tree
-- nmap("<Leader>e", ":NvimTreeToggle<CR>")
nmap("<Leader>e", "<cmd>lua require'dot.config.nvimtree'.toggle_tree()<CR>")

-- Dashboard
nmap("<Leader>;", ":Dashboard<CR>")

-- Telescope find files
nmap("<Leader>f", "<cmd>Telescope find_files<CR>")

-- Save
nmap("<Leader>w", ":w!<CR>")

-- Quit
nmap("<Leader>q", ":q!<CR>")

-- Select all
nmap("<Leader>a", "gg<S-v>G")

-- Open Lazygit
nmap("<Leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>")

-- Reloading vimrc
nmap("<Leader>r", ":source $MYVIMRC<CR>")

-- Glow markdown preview
nmap("<Leader>p", "<cmd>Glow<CR>")

-- Mason
nmap("<Leader>m", "<cmd>Mason<CR>")

-- I hate esc
-- currently not working because which-key setup
-- vim.api.nvim_set_keymap("i", "jj", "<ESC>", opts)

-- Set terminal keymaps
function _G.set_terminal_keymaps()
  tmap("<esc>", [[<C-\><C-n>]])
  tmap("jk", [[<C-\><C-n>]])
  tmap("<C-h>", [[<Cmd>wincmd h<CR>]])
  tmap("<C-j>", [[<Cmd>wincmd j<CR>]])
  tmap("<C-k>", [[<Cmd>wincmd k<CR>]])
  tmap("<C-l>", [[<Cmd>wincmd l<CR>]])
  tmap("<C-w>", [[<C-\><C-n><C-w>]])
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
