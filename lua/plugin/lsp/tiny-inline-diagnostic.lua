-- INFO: Minimal inline LSP diagnostic display
-- NOTE: Shows diagnostics at end of line without virtual text

return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  opts = {
    enable_virtual_text = true, -- Show diagnostic message after error symbol
    delay = 300, -- ms delay after cursor movement
    enable_auto = true, -- Automatically show diagnostics
  },
}
