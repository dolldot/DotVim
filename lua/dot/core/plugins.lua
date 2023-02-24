local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
  execute "packadd packer.nvim"
end

return require("packer").startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Telescope
  use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } }
  use "nvim-telescope/telescope-media-files.nvim"

  -- Provide web icons
  use "kyazdani42/nvim-web-devicons"

  -- Snippet
  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v<CurrentMajor>.*",
    -- install jsregexp (optional!:).
    run = "make install_jsregexp",
  })
  use "rafamadriz/friendly-snippets"

  -- Tree
  use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }

  -- Toggle terminals
  use "akinsho/toggleterm.nvim"

  -- Color highlighter
  use "norcalli/nvim-colorizer.lua"

  -- Autopair
  use "windwp/nvim-autopairs"

  -- Dashboard
  use {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require "dot.packages.dashboard"
    end,
    requires = { "nvim-tree/nvim-web-devicons" },
  }

  -- Highlight for a unique character in every word on a line
  use "unblevable/quick-scope"

  -- Statusline
  use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }

  -- Colorscheme
  use "LunarVim/darkplus.nvim"
  use "folke/tokyonight.nvim"

  -- Comment
  use "numToStr/Comment.nvim"
  -- use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end,
  }
  -- use "sindrets/diffview.nvim"

  -- Which key
  use {
    "folke/which-key.nvim",
    config = function()
      require "dot.packages.which-key"
    end,
  }

  -- Tabline
  use { "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" } }

  -- Formatter
  use "sbdchd/neoformat"

  -- Organizer
  use { "nvim-neorg/neorg", run = ":Neorg sync-parsers", requires = "nvim-lua/plenary.nvim" }

  -- Markdown preview
  use {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup()
    end,
  }

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    -- commit = "668de0951a36ef17016074f1120b6aacbe6c4515",
    -- run = ":TSUpdate",
  }

  -- use "glepnir/lspsaga.nvim"
  -- use "onsails/lspkind-nvim"
  -- use "kosayoda/nvim-lightbulb"
  -- use "mfussenegger/nvim-jdtls"
  -- use "mfussenegger/nvim-dap"
  -- use "kevinhwang91/nvim-bqf"
  -- use "jose-elias-alvarez/nvim-lsp-ts-utils"
  -- use "hashivim/vim-terraform"
  -- use "jose-elias-alvarez/null-ls.nvim"

end)
