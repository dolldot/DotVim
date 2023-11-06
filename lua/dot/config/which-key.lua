local M = {}

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
  ["d"] = "Diagnostic",
  ["e"] = "File explorer",
  ["p"] = "Markdown preview",
  ["m"] = "Mason",
  ["s"] = "Search",
  [";"] = "Dashboard",
  t = {
    name = "Terminal",
    b = { "<cmd>:ToggleTerm size=18 direction=horizontal<CR>", "Terminal Bottom" },
  },
  G = {
    name = "Git",
    o = { "<cmd>Telescope git_status<CR>", "Open Changed File" },
    b = { "<cmd>Telescope git_branches<CR>", "Checkout Branch" },
    c = { "<cmd>Telescope git_commits<CR>", "Checkout Commit" },
    C = { "<cmd>Telescope git_bcommits<CR>", "Checkout Commit Current File" },
  },
  L = {
    name = "LSP",
    f = { "<cmd>Neoformat<CR>", "Format" },
    l = { "<cmd>LspInfo<CR>", "Info" },
    i = { "<cmd>LspInstall<CR>", "Install" },
  },
  P = { name = "Plugin", l = { "<cmd>Lazy<CR>", "Lazy" } },
  f = {
    name = "Telescope",
    b = { "<cmd>Telescope git_branches<CR>", "Checkout Branch" },
    c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<CR>", "Find File" },
    h = { "<cmd>Telescope help_tags<CR>", "Find Help" },
    M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
    R = { "<cmd>Telescope registers<CR>", "Registers" },
    w = { "<cmd>Telescope live_grep<CR>", "Word" },
  },
  T = { name = "Treesitter", i = { "<cmd>TSConfigInfo<CR>", "Info" } },
}

M.setup = function()
  local ok, wk = pcall(require, "which-key")
  if not ok then
    return
  end

  wk.register(mappings, opts)
end

return M
