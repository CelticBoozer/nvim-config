-- NOTE: Enhance LSP experience with UI improvements and additional features

return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "gd", "<cmd>Lspsaga peek_definition<CR>", desc = "Show definition" },
    { "gy", "<cmd>Lspsaga peek_type_definition<CR>", desc = "Show type definition" },
    { "gD", "<cmd>Lspsaga goto_definition<CR>", desc = "Go to definition" },
    { "gY", "<cmd>Lspsaga goto_type_definition<CR>", desc = "Go to type definition" },
    { "<leader>aa", "<cmd>Lspsaga code_action<CR>", desc = "Show actions" },
    { "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Go to next diagnostic" },
    { "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Go to previous diagnostic" },
    { "<leader>fr", "<cmd>Lspsaga finder<CR>", desc = "Show references" },
    { "<leader>tl", "<cmd>Lspsaga show_workspace_diagnostics ++normal<CR>", desc = "Diagnostic window" },
    { "<leader>?", "<cmd>Lspsaga hover_doc<CR>", desc = "Show documentation" },
    { "<leader>to", "<cmd>Lspsaga outline<CR>", desc = "Outline window" },
  },
  opts = {
    ui = { code_action = "" },
    finder = {
      keys = {
        vsplit = "S",
      },
    },
    outline = {
      keys = {
        jump = "<CR>",
      },
    },
    rename = {
      keys = {
        quit = "q",
      },
    },
  },
}
