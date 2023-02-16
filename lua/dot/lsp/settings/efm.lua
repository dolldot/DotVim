local M = {}

M.setup = function()
  local luaFormat = { formatCommand = "lua-format -i", formatStdin = true }

  local prettier = {
    formatCommand = "prettier --stdin-filepath ${INPUT}",
    formatStdin = true,
  }

  local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = { "%f:%l:%c: %m" },
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true,
  }

  require"lspconfig".efm.setup {
    cmd = { "/Users/dolldot/go/bin/efm-langserver" },
    init_options = { documentFormatting = true },
    filetypes = { "lua", "python", "javascriptreact", "javascript" },
    settings = {
      rootMarkers = { ".git/", "package.json" },
      languages = {
        lua = { luaFormat },
        javascript = { prettier, eslint },
        javascriptreact = { prettier, eslint },
      },
    },
  }
end

return M
