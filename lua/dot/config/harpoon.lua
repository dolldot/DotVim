local M = {}

M.setup = function()
  local status, harpoon = pcall(require, "harpoon")
  if (not status) then
    return
  end

  -- REQUIRED
  harpoon.setup()
  -- REQUIRED

  vim.keymap.set("n", "<leader>a", function()
    harpoon:list():append()
  end)
  vim.keymap.set("n", "<C-e>", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)

  vim.keymap.set("n", "<C-h>", function()
    harpoon:list():select(1)
  end)
  vim.keymap.set("n", "<C-t>", function()
    harpoon:list():select(2)
  end)
  vim.keymap.set("n", "<C-n>", function()
    harpoon:list():select(3)
  end)
  vim.keymap.set("n", "<C-s>", function()
    harpoon:list():select(4)
  end)

  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set("n", "<C-P>", function()
    harpoon:list():prev()
  end)
  vim.keymap.set("n", "<C-N>", function()
    harpoon:list():next()
  end)
end

return M
