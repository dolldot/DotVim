local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.:h")
  if fpath == "" or fpath == "." then
    return " "
  end

  return string.format(" %%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand("%:t")
  if fname == "" then
    return ""
  end
  return fname .. " "
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, _ in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, {}))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = "  " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = "  " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = "  " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = "  " .. count["info"]
  end

  return errors .. warnings .. hints .. info
end

local function filetype()
  local flname = vim.api.nvim_buf_get_name(0)
  local extention = vim.fn.fnamemodify(flname, ":e")
  local icon = require("nvim-web-devicons").get_icon_color(filename, extention, { default = true })
  return string.format(" %s %s ", icon, vim.bo.filetype)
end

local function lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return " %l:%c "
end

local git = function()
  local head = vim.b.gitsigns_head
  if not head then
    return "  "
  end

  return string.format("  %s ", head)
end

local tabs = function()
  local data = {}

  local tabpages = vim.api.nvim_list_tabpages()
  if #tabpages < 2 then
    return ""
  end

  local currtab = vim.fn.tabpagenr()
  for _, tab in ipairs(tabpages) do
    local templ = ""

    local tab_number = vim.api.nvim_tabpage_get_number(tab)
    if currtab == tab_number then
      templ = table.concat({
        "%#active_tab#",
        "",
        string.format(" %s ", tab_number),
      })
      table.insert(data, templ)
    else
      templ = table.concat({
        "%#other_tab#",
        "",
        string.format(" %s ", tab_number),
      })
      table.insert(data, templ)
    end
  end
  return table.concat(data)
end

Statusline = {}

Statusline.active = function()
  return table.concat({
    "%#first#",
    mode(),
    "%#first_separator#",
    "",
    "%#second#",
    filepath(),
    filename(),
    "%#second_separator#",
    "",
    "%#divider#",
    lsp(),
    "%=",
    lineinfo(),
    tabs(),
    "%#third_separator#",
    "",
    "%#third#",
    filetype(),
    "%#forth_separator#",
    "",
    "%#forth#",
    git(),
  })
end

function Statusline.inactive()
  return " %F"
end

-- colorpalette
-- https://colorhunt.co/palette/49243e704264bb8493dbafa0
vim.cmd.highlight("first guibg=#BB8493 guifg=#49243E")
vim.cmd.highlight("first_separator guibg=#49243E guifg=#BB8493")
vim.cmd.highlight("second guibg=#49243E guifg=#BB8493")
vim.cmd.highlight("second_separator guibg=transparent guifg=#49243E")
vim.cmd.highlight("divider guibg=transparent guifg=#704264")
vim.cmd.highlight("third_separator guibg=transparent guifg=#49243E")
vim.cmd.highlight("third guibg=#49243E guifg=#BB8493")
vim.cmd.highlight("forth_separator guibg=#49243E guifg=#BB8493")
vim.cmd.highlight("forth guibg=#BB8493 guifg=#49243E")
vim.cmd.highlight("active_tab guibg=transparent guifg=#BB8493")
vim.cmd.highlight("other_tab guibg=transparent guifg=#704264")

vim.go.statusline = Statusline.active()
