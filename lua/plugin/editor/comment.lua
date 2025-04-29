-- INFO: Smart comment toggling with context awareness
-- NOTE: Supports language-specific comment styles.

return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- INFO: Initialize Treesitter and context-aware commentstring integration.
    require("nvim-treesitter.configs").setup({})
    require("ts_context_commentstring").setup({})

    -- INFO: Configure Comment.nvim with a pre-hook for context-aware commenting.
    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      toggler = {
        line = "<leader>cc", -- Toggle line comment
        block = "<leader>cb", -- Toggle block comment
      },
      opleader = {
        line = "<leader>cc", -- Operator-pending line comment
        block = "<leader>cb", -- Operator-pending block comment
      },
      extra = {
        eol = "<leader>cA", -- Comment at the end of line
      },
    })
  end,
}
