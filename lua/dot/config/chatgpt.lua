local M = {}

local config = {
  api_key_cmd = "python3 /Users/dolldot/Mine/dolldot/project/paperknife/scripts/crypt.py decrypt 5ByaXxRH+Eqke9Dls3dhWHgdf3FMfL45nsl/uJKVAnm27PdqFyOjzy+VS6SUUTnNp4IEh/5oHpD4aXEVuzJO1w==",
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

  local utils = require("dot.utils")
  local dmap = utils.set_keymapd

  dmap({ "n", "v" }, "<Leader>C", "<cmd>ChatGPT<CR>", "ChatGPT")
  dmap({ "n", "v" }, "<Leader>Ce", "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction")
  dmap({ "n", "v" }, "<Leader>Cg", "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction")
  dmap({ "n", "v" }, "<Leader>Ct", "<cmd>ChatGPTRun translate<CR>", "Translate")
  dmap({ "n", "v" }, "<Leader>Ck", "<cmd>ChatGPTRun keywords<CR>", "Keywords")
  dmap({ "n", "v" }, "<Leader>Cd", "<cmd>ChatGPTRun docstring<CR>", "Docstring")
  dmap({ "n", "v" }, "<Leader>Ca", "<cmd>ChatGPTRun add_tests<CR>", "Add Tests")
  dmap({ "n", "v" }, "<Leader>Co", "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code")
  dmap({ "n", "v" }, "<Leader>Cs", "<cmd>ChatGPTRun summarize<CR>", "Summarize")
  dmap({ "n", "v" }, "<Leader>Cf", "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs")
  dmap({ "n", "v" }, "<Leader>Cx", "<cmd>ChatGPTRun explain_code<CR>", "Explain Code")
  dmap({ "n", "v" }, "<Leader>Cr", "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit")
  dmap({ "n", "v" }, "<Leader>Cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis")

  chatgpt.setup(config)
end

return M
