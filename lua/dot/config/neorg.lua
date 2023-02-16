local ok, neorg = pcall(require, "neorg")
if not ok then
  return
end

neorg.setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {},
    ["core.keybinds"] = {
      config = { default_keybinds = true, neorg_leader = "<Leader>o" },
    },
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          mine = "~/Mine/dolldot/neorg",
          work = "~/Mine/mora/OPS/notes",
        },
        autochdir = true,
        index = "main.norg",
      },
    },
    ["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
  },
}
