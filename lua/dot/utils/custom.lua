local M = {}

function M.search()
  local Input = require("nui.input")
  local event = require("nui.utils.autocmd").event

  local input = Input({
    position = "50%",
    size = { width = 30 },
    border = {
      style = "single",
      text = { top = "[Search?]", top_align = "center" },
    },
    win_options = { winhighlight = "Normal:Normal,FloatBorder:Normal" },
  }, {
    prompt = "> ",
    default_value = "",
    on_close = function()
      print("Input Closed!")
    end,
    on_submit = function(value)
      print("Searching: " .. value)
      vim.cmd("/" .. value)
    end,
  })

  -- mount/open the component
  input:mount()

  -- unmount component when cursor leaves buffer
  input:on(event.BufLeave, function()
    input:unmount()
  end)

end

return M
