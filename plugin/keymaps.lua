local utils = require("dot.utils")
local nmap = utils.set_keymapn
local vmap = utils.set_keymapv
local xmap = utils.set_keymapx
local tmap = utils.set_keymapt

-- Set leader key
nmap("<Space>", "<NOP>")
-- vim.g.mapleader = " "

nmap("<C-h>", "<cmd>TmuxNavigateLeft<CR>")
nmap("<C-l>", "<cmd>TmuxNavigateRight<CR>")
nmap("<C-j>", "<cmd>TmuxNavigateDown<CR>")
nmap("<C-k>", "<cmd>TmuxNavigateUp<CR>")

-- Window Adjustment
nmap("<Leader>z", "<C-w>|", "Focus Window")
nmap("<Leader>=", "<C-w>=", "Resize Window")

-- Split window
nmap("ss", ":split<Return><C-w>w")
nmap("sv", ":vsplit<Return><C-w>w")

-- Buffer navigation
nmap("s>", "<cmd>bnext<CR>")
nmap("s<", "<cmd>bprev<CR>")
nmap("sq", "<cmd>Bdelete<CR>")

-- Tab navigation
nmap("sn", "<cmd>tabn<CR>")
nmap("sp", "<cmd>tabp<CR>")
nmap("sc", "<cmd>tabnew<CR>")

-- Indentation
vmap("<", "<gv")
vmap(">", ">gv")

-- Move selected line /block of text in visual mode
xmap("K", ":move '<-2<CR>gv-gv'")
xmap("J", ":move '>+1<CR>gv-gv'")

-- Save
nmap("<Leader>w", ":w!<CR>", "Save")
nmap("<Leader>s", ":w!<CR>", "Save")

-- Quit
nmap("<Leader>q", ":q!<CR>", "Quit")
nmap("<Leader>.", ":q!<CR>", "Quit")

-- Select all
nmap("<Leader>o", "gg<S-v>G", "Select all")

-- Toggle tree
nmap("<Leader>e", ":Oil<CR>", "File Explorer")

-- Dashboard
-- nmap("<Leader>;", ":Dashboard<CR>", "Dashboard")

-- Package Manager
nmap("<Leader>pm", "<cmd>Mason<CR>", "Mason")
nmap("<Leader>pl", "<cmd>Lazy<CR>", "Lazy")

-- LSP
nmap("<Leader>la", "<cmd>LspInstall<CR>", "Install")
nmap("<Leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", "Format")
nmap("<Leader>li", "<cmd>LspInfo<CR>", "Info")
nmap("<Leader>lt", "<cmd>Trouble<CR>", "Trouble")

-- Editing Mode
nmap("<Leader>ma", "<cmd>ZenMode | Pencil<CR>", "ZenMode with Pencil")
nmap("<Leader>mt", "<cmd>Twilight<CR>", "Twilight")
nmap("<Leader>mz", "<cmd>ZenMode<CR>", "ZenMode")

-- Execute File
nmap("<Leader>x", "<cmd>source %<CR>", "Execute this file")

-- Undo Tree
nmap("<Leader>u", "<cmd>UndotreeToggle<CR>", "Undotree")

-- Git
nmap("<Leader>g", "<cmd>Git<CR>", "Git")

-- DB
nmap("<Leader>db", "<cmd>DBUI<CR>", "DB")

-- Custom
nmap("<Leader>,c", require("dot.utils").set_colorscheme, "Apply colorscheme")
nmap("<Leader>,l", require("dot.utils").toggle_log, "Toggle log")

-- Set terminal keymaps
nmap("<Leader>t", "<cmd>:term<CR>", "Terminal")

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
