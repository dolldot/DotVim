local M = {}

_G.dotneotreeconfig = { window = { position = "left" } }

M.setup = function()
  local ok, neotree = pcall(require, "neo-tree")
  if (not ok) then
    return
  end

  -- local utils = require("dot.utils")

  neotree.setup(_G.dotneotreeconfig)
end

return M
