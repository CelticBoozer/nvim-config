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
      group = " ",
      separator = "",
      breadcrumb = "»",
    },
    win = {
      border = "rounded",
    },
    layout = {
      spacing = 4,
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Common prefix registrations
    wk.add({
      { "<leader>c", group = "Comment", icon = "󰿟 " },
      { "<leader>d", group = "Debug" },
      { "<leader>e", group = "Execute", icon = " " },
      { "<leader>f", group = "Find", icon = " " },
      { "<leader>r", group = "Refactor" },
      { "<leader>s", group = "Session" },
      { "<leader>t", group = "Tool panels", icon = " " },
    })
  end,
}
