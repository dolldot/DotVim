local kmap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local wk_opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

-- Set leader key
kmap("n", "<Space>", "<NOP>", opts)
vim.g.mapleader = " "

-- File explorer
-- kmap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)
kmap("n", "<Leader>e",
     "<cmd>lua require'dot.config.nvimtree'.toggle_tree()<CR>", opts)

kmap("n", "<Leader>h",
     "<cmd>lua require'dot.config.nvimtree'.toggle_tree_long()<CR>", opts)

-- Dashboard
kmap("n", "<Leader>;", ":Dashboard<CR>", opts)

-- Telescope find files
kmap("n", "<Leader>f", "<cmd>Telescope find_files<cr>", opts)

-- Save
kmap("n", "<Leader>w", ":w!<CR>", opts)

-- Quit
kmap("n", "<Leader>q", ":q!<CR>", opts)

-- Select all
kmap("n", "<Leader>a", "gg<S-v>G", opts)

-- Open Lazygit
kmap("n", "<Leader>lg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Reloading vimrc
kmap("n", "<Leader>r", ":source $MYVIMRC<CR>", opts)

-- Glow markdown preview
kmap("n", "<Leader>g", "<cmd>Glow<CR>", opts)

-- Mason
kmap("n", "<Leader>m", "<cmd>Mason<CR>", opts)

local mappings = {
  ["a"] = "Select all",
  ["w"] = "Save",
  ["q"] = "Quit",
  ["e"] = "File explorer",
  ["f"] = "Find file",
  ["g"] = "Markdown preview",
  ["l"] = "Lazygit",
  ["m"] = "Mason",
  [";"] = "Dashboard",
  n = {
    name = "Neorg",
    m = { "<cmd>Neorg workspace mine<CR>", "Neorg Mine" },
    w = { "<cmd>Neorg workspace work<CR>", "Neorg Work" },
  },
  t = {
    name = "Terminal",
    l = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    b = { "<cmd>:ToggleTerm size=18 direction=horizontal<CR>",
          "Terminal Bottom" },
  },
  G = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
          "Undo Stage Hunk" },
    o = { "<cmd>Telescope git_status<CR>", "Open Changed File" },
    b = { "<cmd>Telescope git_branches<CR>", "Checkout Branch" },
    c = { "<cmd>Telescope git_commits<CR>", "Checkout Commit" },
    C = { "<cmd>Telescope git_bcommits<CR>", "Checkout Commit Current File" },
    d = { "<cmd>DiffviewOpen<CR>", "Open Diffview" },
    D = { "<cmd>DiffviewClose<CR>", "Close Diffview" },
  },
  L = {
    name = "LSP",
    f = { "<cmd>Neoformat<CR>", "Format" },
    i = { "<cmd>LspInfo<CR>", "Info" },
  },
  P = {
    name = "Packer",
    c = { "<cmd>PackerCompile<CR>", "Compile" },
    i = { "<cmd>PackerInstall<CR>", "Install" },
    s = { "<cmd>PackerSync<CR>", "Sync" },
    u = { "<cmd>PackerUpdate<CR>", "Update" },
  },
  S = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<CR>", "Checkout Branch" },
    c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<CR>", "Find File" },
    h = { "<cmd>Telescope help_tags<CR>", "Find Help" },
    M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
    R = { "<cmd>Telescope registers<CR>", "Registers" },
    t = { "<cmd>Telescope live_grep<CR>", "Text" },
  },
  T = { name = "Treesitter", i = { "<cmd>TSConfigInfo<CR>", "Info" } },
}

local ok, wk = pcall(require, "which-key")
if not ok then
  return
end

wk.register(mappings, wk_opts)
