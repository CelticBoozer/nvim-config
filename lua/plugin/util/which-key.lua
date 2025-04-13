-- INFO: Keybinding discovery and documentation
-- NOTE: Provides visual hints for leader key mappings
-- luacheck: globals vim

return {
  "folke/which-key.nvim",
  keys = {
    {
      "<leader><leader>",
      function()
        vim.cmd.WhichKey()
      end,
      desc = "Show active keymaps",
    },
  },
  opts = {
    icons = {
      group = vim.g.icons_enabled and "" or "+",
      separator = "",
      breadcrumb = "»",
    },
    window = {
      border = "rounded",
      margin = { 1, 0, 1, 0 },
    },
    layout = {
      spacing = 4,
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Common prefix registrations
    wk.register({
      ["<leader>"] = {
        f = { name = "Find" },
        d = { name = "Debug" },
        g = { name = "Git" },
        l = { name = "LSP" },
        s = { name = "Search" },
        w = { name = "Workspace" },
      },
    })
  end,
}
