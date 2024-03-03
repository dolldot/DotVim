-- LuaFormatter off
local plugins = {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    enabled = true,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
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
    config = function ()
      require("luasnip").setup()
    end,
    enabled = true,
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    lazy = true,
    enabled = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
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
    tag = "0.1.5",
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
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
    "nvim-lua/plenary.nvim",
    lazy = false,
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
    enabled = false,
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    config = function()
      require("dot.config.bufferline").setup()
    end,
    enabled = false,
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
    enabled = false,
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
      require("which-key").setup()
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
    main = "ibl",
    opts = {
      exclude = { filetypes = { "dashboard" }}
    },
    enabled = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("dot.config.gitsigns").setup()
    end,
    enabled = true,
  },
  {
    "famiu/bufdelete.nvim",
    enabled = true,
  },
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
        require'window-picker'.setup()
    end,
    enabled = true,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    enabled = true,
  },
  {
    "onsails/lspkind.nvim",
    name = "lspkind",
  },
  {
    "folke/trouble.nvim",
    enabled = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("dot.config.chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  "folke/twilight.nvim",
  "preservim/vim-pencil",
  {
    "folke/zen-mode.nvim",
    config = function()
      require("dot.config.zen-mode").setup()
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      require("dot.config.harpoon").setup()
    end
  }
}
-- LuaFormatter on
require("lazy").setup(plugins)
