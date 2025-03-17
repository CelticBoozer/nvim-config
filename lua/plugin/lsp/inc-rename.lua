-- NOTE: Interactive LSP rename with preview

return {
  "smjonas/inc-rename.nvim",
  event = "BufReadPre",
  dependencies = {
    "stevearc/dressing.nvim"
  },
  keys = {
    { "<leader>rn", ":IncRename ", desc = "Rename symbol" },
  },
  opts = {
    input_buffer_type = "dressing", -- Use dressing.nvim if available
  },
}
