-- INFO: Optimize LSP memory usage by managing client lifecycle
-- NOTE: Automatically stops unused LSP clients to save RAM

return {
  "zeioth/garbage-day.nvim",
  event = "VeryLazy",
  dependencies = { "neovim/nvim-lspconfig" },
  opts = {},
}
