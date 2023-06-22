local ok, neorg = pcall(require, "neorg")
if not ok then
  return
end

neorg.setup {
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {},
    ["core.keybinds"] = { config = { default_keybinds = true, neorg_leader = "<Leader>o" } },
    ["core.dirman"] = {
      config = {
        workspaces = { mine = "~/Mine/dolldot/neorg", work = "~/Mine/mora/OPS/notes" },
        default_workspace = "mine",
        autochdir = true,
        index = "main.norg",
      },
    },
    ["core.completion"] = { config = { engine = "nvim-cmp" } },
  },
}
