local M = {}

local config = {
  openai_params = {
    model = "gpt-3.5-turbo",
    -- model = "gpt-4",
    frequency_penalty = 0,
    presence_penalty = 0,
    max_tokens = 1000,
    temperature = 0,
    top_p = 1,
    n = 1,
  },
  openai_edit_params = {
    model = "gpt-3.5-turbo",
    frequency_penalty = 0,
    presence_penalty = 0,
    temperature = 0,
    top_p = 1,
    n = 1,
  },
}

M.setup = function()
  local status, chatgpt = pcall(require, "chatgpt")
  if (not status) then
    return
  end

  chatgpt.setup(config)
end

return M
