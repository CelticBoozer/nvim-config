-- INFO: Minimal inline LSP diagnostic display
-- NOTE: Shows diagnostics at end of line without virtual text.

return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  opts = {
    enable_virtual_text = true,
    delay = 300,
    enable_auto = true,
  },
}
