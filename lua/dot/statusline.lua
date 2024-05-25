-- local modes = {
--   ["n"] = "NORMAL",
--   ["no"] = "NORMAL",
--   ["v"] = "VISUAL",
--   ["V"] = "VISUAL LINE",
--   [""] = "VISUAL BLOCK",
--   ["s"] = "SELECT",
--   ["S"] = "SELECT LINE",
--   [""] = "SELECT BLOCK",
--   ["i"] = "INSERT",
--   ["ic"] = "INSERT",
--   ["R"] = "REPLACE",
--   ["Rv"] = "VISUAL REPLACE",
--   ["c"] = "COMMAND",
--   ["cv"] = "VIM EX",
--   ["ce"] = "EX",
--   ["r"] = "PROMPT",
--   ["rm"] = "MOAR",
--   ["r?"] = "CONFIRM",
--   ["!"] = "SHELL",
--   ["t"] = "TERMINAL",
-- }
--
-- local function mode()
--   local current_mode = vim.api.nvim_get_mode().mode
--   return string.format(" %s ", modes[current_mode]):upper()
-- end
--
-- local function filepath()
--   local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
--   if fpath == "" or fpath == "." then
--     return " "
--   end
--
--   return string.format(" %%<%s/", fpath)
-- end
--
-- local function filename()
--   local fname = vim.fn.expand "%:t"
--   if fname == "" then
--     return ""
--   end
--   return fname .. " "
-- end
--
-- local function lsp()
--   local count = {}
--   local levels = {
--     errors = "Error",
--     warnings = "Warn",
--     info = "Info",
--     hints = "Hint",
--   }
--
--   for k, level in pairs(levels) do
--     count[k] = vim.tbl_count(vim.diagnostic.get(0, {}))
--   end
--
--   local errors = ""
--   local warnings = ""
--   local hints = ""
--   local info = ""
--
--   if count["errors"] ~= 0 then
--     errors = " %#LspDiagnosticsSignError# " .. count["errors"]
--   end
--   if count["warnings"] ~= 0 then
--     warnings = " %#LspDiagnosticsSignWarning# " .. count["warnings"]
--   end
--   if count["hints"] ~= 0 then
--     hints = " %#LspDiagnosticsSignHint# " .. count["hints"]
--   end
--   if count["info"] ~= 0 then
--     info = " %#LspDiagnosticsSignInformation# " .. count["info"]
--   end
--
--   return errors .. warnings .. hints .. info .. "%#Normal#"
-- end
--
-- local function filetype()
--   return string.format(" %s ", vim.bo.filetype):upper()
-- end
--
-- local function lineinfo()
--   if vim.bo.filetype == "alpha" then
--     return ""
--   end
--   return " %P %l:%c "
-- end
--
--
-- Statusline = {}
--
-- Statusline.active = function()
--   return table.concat {
--     "%#StatusLine#",
--     mode(),
--     filepath(),
--     filename(),
--     -- "%=%#StatusLineExtra#",
--     filetype(),
--     lineinfo(),
--   }
-- end
--
-- function Statusline.inactive()
--   return " %F"
-- end
--
-- function Statusline.short()
--   return "%#StatusLineNC#"
-- end
--
-- -- vim.cmd.highlight "StatusLine guibg=#ffffff guifg=#000000"
-- -- vim.cmd.highlight "Middle guibg=Yellow guifg=Black"
-- -- vim.cmd.highlight "QuarterEnd guibg=Red guifg=Yellow"
-- -- vim.cmd.highlight "StatusLineExtra guibg=Orange guifg=Black"
-- vim.go.statusline = Statusline.active()