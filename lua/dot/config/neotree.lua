local M = {}

_G.dotneotreeconfig = {
  window = { position = "left" },
  event_handlers = {
    -- {
    --  event = "neo_tree_window_before_open",
    --  handler = function(args)
    --    print("neo_tree_window_before_open", vim.inspect(args))
    --  end
    -- },
    {
      event = "neo_tree_window_after_open",
      handler = function(args)
        if args.position == "left" or args.position == "right" then
          vim.cmd("wincmd =")
        end
      end,
    },
    -- {
    --  event = "neo_tree_window_before_close",
    --  handler = function(args)
    --    print("neo_tree_window_before_close", vim.inspect(args))
    --  end
    -- },
    {
      event = "neo_tree_window_after_close",
      handler = function(args)
        if args.position == "left" or args.position == "right" then
          vim.cmd("wincmd =")
        end
      end,
    },
  },
}

M.setup = function()
  local ok, neotree = pcall(require, "neo-tree")
  if (not ok) then
    return
  end

  -- local utils = require("dot.utils")

  neotree.setup(_G.dotneotreeconfig)
end

return M
