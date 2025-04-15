-- INFO: Enhanced UI components for inputs and selects
-- NOTE: Improves default Neovim UI elements with modern styling

return {
  "stevearc/dressing.nvim",
  opts = {
    input = {
      relative = "cursor",
      prefer_width = 40,
      min_width = 20,
      border = "rounded",
    },
  },
}
