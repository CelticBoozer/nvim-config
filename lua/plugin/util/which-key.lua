-- INFO: Keybinding discovery and documentation
-- NOTE: Provides visual hints for leader key mappings

return {
  "folke/which-key.nvim",
  lazy = false,
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
        t = { name = "Tool panels" },
        d = { name = "Debug" },
        s = { name = "Session" },
        c = { name = "Comment" },
        r = { name = "Refactor" },
      },
    })
  end,
}
