-- INFO: Git indicators in the gutter
-- NOTE: Provides git diff information in the gutter.

return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPost",
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
  },
}
