local ok, wk = pcall(require, "which-key")
if not ok then
  return
end

-- LuaFormatter off
local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false
}
-- LuaFormatter on

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
  t = { name = "Terminal", b = { "<cmd>:ToggleTerm size=18 direction=horizontal<CR>", "Terminal Bottom" } },
  G = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "Undo Stage Hunk" },
    o = { "<cmd>Telescope git_status<CR>", "Open Changed File" },
    b = { "<cmd>Telescope git_branches<CR>", "Checkout Branch" },
    c = { "<cmd>Telescope git_commits<CR>", "Checkout Commit" },
    C = { "<cmd>Telescope git_bcommits<CR>", "Checkout Commit Current File" },
    d = { "<cmd>DiffviewOpen<CR>", "Open Diffview" },
    D = { "<cmd>DiffviewClose<CR>", "Close Diffview" },
  },
  L = { name = "LSP", f = { "<cmd>Neoformat<CR>", "Format" }, i = { "<cmd>LspInfo<CR>", "Info" } },
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

wk.register(mappings, opts)
