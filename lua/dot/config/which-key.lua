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
  -- ["c"] = "Custom function",
  ["w"] = "Save",
  ["q"] = "Quit",
  ["d"] = "Diagnostic",
  ["e"] = "File explorer",
  ["p"] = "Markdown preview",
  ["m"] = "Mason",
  ["s"] = "Search",
  [";"] = "Dashboard",
  c = {
    name = "ChatGPT",
    c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
    g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
    t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
    k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
    d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
    a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
    o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
    s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
    f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
    x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
    r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
    l = {
      "<cmd>ChatGPTRun code_readability_analysis<CR>",
      "Code Readability Analysis",
      mode = { "n", "v" },
    },
  },
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
    t = { "<cmd>Trouble<CR>", "Trouble" },
  },
  P = { name = "Plugin", l = { "<cmd>Lazy<CR>", "Lazy" } },
  f = {
    name = "Telescope",
    b = { "<cmd>Telescope buffers<CR>", "Buffers" },
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
