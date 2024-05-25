return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        "nvim-telescope/telescope-fzf-native.nvim",

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = "make",

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
    config = function()
      local telescope = require("telescope")
      local utils = require("dot.utils")
      local nmap = utils.set_keymapn

      -- Telescope
      local builtin = require("telescope.builtin")
      nmap("<leader>fh", builtin.help_tags, "[S]earch [H]elp")
      nmap("<leader>fk", builtin.keymaps, "[S]earch [K]eymaps")
      nmap("<leader>ff", builtin.find_files, "[S]earch [F]iles")
      nmap("<leader>fc", builtin.colorscheme, "[S]earch [C]olorcheme")
      nmap("<leader>fs", builtin.builtin, "[S]earch [S]elect Telescope")
      nmap("<leader>fw", builtin.grep_string, "[S]earch current [W]ord")
      nmap("<leader>fg", builtin.live_grep, "[S]earch by [G]rep")
      nmap("<leader>fd", builtin.diagnostics, "[S]earch [D]iagnostics")
      nmap("<leader>fr", builtin.resume, "[S]earch [R]esume")
      nmap("<leader>f.", builtin.oldfiles, '[S]earch Recent Files ("." for repeat)')
      nmap("<leader><leader>", builtin.buffers, "[ ] Find existing buffers")

      telescope.load_extension("fzf")
      telescope.load_extension("yaml_schema")

      local config = {
        defauts = { color_devicons = true, selection_caret = "" },
        pickers = { colorscheme = { enable_preview = true } },
      }
      telescope.setup(config)
    end,
  },
}
