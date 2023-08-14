-- LuaFormatter off
local plugins = {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    enabled = true,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    config = function()
      require("dot.lsp").setup()
    end,
    enabled = true,
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    enabled = true,
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    enabled = true,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    lazy = true,
    enabled = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup{
        ensure_installed = { "lua_ls", "yamlls", "terraformls", "gopls", "tsserver" }
      }
    end,
    cmd = { "LspInstall", "LspUninstall" },
    lazy = true,
    enabled = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("dot.config.treesitter").setup()
    end,
    enabled = true,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup{}
    end,
    enabled = true,
  },
  {
    "sbdchd/neoformat",
    enabled = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    config = function()
      require("dot.config.telescope").setup()
    end,
    enabled = true,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    enabled = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    config = function()
      require("dot.config.lualine").setup()
    end,
    enabled = true,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    config = function()
      require("dot.config.neotree").setup()
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    enabled = true,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    config = function()
      require("dot.config.bufferline").setup()
    end,
    enabled = true,
  },
  {
    "glepnir/dashboard-nvim",
    event = 'VimEnter',
    config = function()
      require("dot.config.dashboard").setup()
    end,
    enabled = true,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    enabled = true,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("dot.config.noice").setup()
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    enabled = true,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("dot.config.comment").setup()
    end,
    lazy = false,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    enabled = true,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("dot.config.which-key").setup()
    end,
    enabled = true,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("dot.config.toggleterm").setup()
    end,
    enabled = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("dot.config.gitsigns").setup()
    end,
    enabled = true,
  },
}
-- LuaFormatter on
require("lazy").setup(plugins)
