local M = {}

local config = {
  defauts = { color_devicons = true, selection_caret = "" },
  pickers = { colorscheme = { enable_preview = true } },
}

M.setup = function()
  local ok, telescope = pcall(require, "telescope")
  if not ok then
    return
  end

  local utils = require("dot.utils")
  local nmap = utils.set_keymapn

  -- Telescope
  local builtin = require "telescope.builtin"
  nmap("<leader>fh", builtin.help_tags, "[S]earch [H]elp")
  nmap("<leader>fk", builtin.keymaps, "[S]earch [K]eymaps")
  nmap("<leader>ff", builtin.find_files, "[S]earch [F]iles")
  nmap("<leader>fs", builtin.builtin, "[S]earch [S]elect Telescope")
  nmap("<leader>fw", builtin.grep_string, "[S]earch current [W]ord")
  nmap("<leader>fg", builtin.live_grep, "[S]earch by [G]rep")
  nmap("<leader>fd", builtin.diagnostics, "[S]earch [D]iagnostics")
  nmap("<leader>fr", builtin.resume, "[S]earch [R]esume")
  nmap("<leader>f.", builtin.oldfiles, "[S]earch Recent Files (\".\" for repeat)")
  nmap("<leader><leader>", builtin.buffers, "[ ] Find existing buffers")

  telescope.load_extension("fzf")
  telescope.setup(config)
end

return M
