-- INFO: Enhanced LSP UI with interactive features
-- NOTE: Provides IDE-like interactions for code navigation and diagnostics

return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "gd", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition", mode = "n" },
    { "gD", "<cmd>Lspsaga goto_definition<CR>", desc = "Goto definition", mode = "n" },
    { "gy", "<cmd>Lspsaga peek_type_definition<CR>", desc = "Peek type definition", mode = "n" },
    { "gY", "<cmd>Lspsaga goto_type_definition<CR>", desc = "Goto type definition", mode = "n" },
    { "<leader>aa", "<cmd>Lspsaga code_action<CR>", desc = "Code action", mode = { "n", "v" } },
    { "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next diagnostic", mode = "n" },
    { "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Prev diagnostic", mode = "n" },
    { "<leader>fr", "<cmd>Lspsaga finder<CR>", desc = "References finder", mode = "n" },
    { "<leader>tl", "<cmd>Lspsaga show_buf_diagnostics ++normal<CR>", desc = "File diagnostics", mode = "n" },
    {
      "<leader>tL",
      "<cmd>Lspsaga show_workspace_diagnostics ++normal<CR>",
      desc = "Workspace diagnostics",
      mode = "n",
    },
    { "<leader>?", "<cmd>Lspsaga hover_doc<CR>", desc = "Hover documentation", mode = "n" },
    { "<leader>to", "<cmd>Lspsaga outline<CR>", desc = "Symbols outline", mode = "n" },
  },
  opts = {
    ui = {
      code_action = "",
      title = true,
      border = "rounded",
      colors = {
        normal_bg = "#252423",
      },
    },
    finder = {
      keys = {
        vsplit = "S",
        split = "s",
        quit = "q",
      },
    },
    outline = {
      keys = {
        jump = "<CR>",
        quit = "q",
      },
    },
    rename = {
      keys = {
        quit = "q",
        select = "<CR>",
      },
    },
    symbol_in_winbar = {
      enable = true,
    },
  },
}
