return {
  {
    "folke/zen-mode.nvim",
    opts = {
      window = { options = { number = false, relativenumber = false } },
      plugins = { twilight = { enabled = true }, tmux = { enabled = true } },
    },
    dependencies = { "folke/twilight.nvim", "preservim/vim-pencil" },
  },
}
