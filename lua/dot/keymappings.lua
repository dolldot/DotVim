local utils = require("dot.utils")
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

nmap("<C-h>", "<cmd>TmuxNavigateLeft<CR>")
nmap("<C-l>", "<cmd>TmuxNavigateRight<CR>")
nmap("<C-j>", "<cmd>TmuxNavigateDown<CR>")
nmap("<C-k>", "<cmd>TmuxNavigateUp<CR>")

nmap("<C-j>", "<C-w>l")

-- Split window
nmap("ss", ":split<Return><C-w>w")
nmap("sv", ":vsplit<Return><C-w>w")

-- Buffer navigation
nmap("s>", "<cmd>bnext<CR>")
nmap("s<", "<cmd>bprev<CR>")
nmap("sc", "<cmd>Bdelete<CR>")

-- Indentation
vmap("<", "<gv")
vmap(">", ">gv")

-- Move selected line /block of text in visual mode
xmap("K", ":move '<-2<CR>gv-gv'")
xmap("J", ":move '>+1<CR>gv-gv'")

-- Save
nmap("<Leader>w", ":w!<CR>")
nmap("<Leader>s", ":w!<CR>")

-- Quit
nmap("<Leader>q", ":q!<CR>")
nmap("<Leader>.", ":q!<CR>")

-- Select all
nmap("<Leader>a", "gg<S-v>G")

-- Toggle tree
nmap("<Leader>e", ":Neotree toggle<CR>")

-- Dashboard
nmap("<Leader>;", ":Dashboard<CR>")

-- Mason
nmap("<Leader>m", "<cmd>Mason<CR>")

-- LSP
nmap("<Leader>d", vim.diagnostic.open_float)

-- Custom
-- nmap("<Leader>s", require("dot.utils.custom").search)
-- nmap("<Leader>c", require("dot.utils").switch_neotree_pos)

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
