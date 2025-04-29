-- INFO: Visualize guides at multiple specific text widths
-- NOTE: Provides a visual guide at specific column widths

return {
  "lukas-reineke/virt-column.nvim",
  event = "BufReadPost",
  opts = {
    char = "▕",
    virtcolumn = "80,100,120", -- draw rulers at columns 80, 100, and 120
  },
}
