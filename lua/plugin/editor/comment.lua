-- INFO: Smart comment toggling with context awareness
-- NOTE: Supports language-specific comment styles

return {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- First ensure treesitter is initialized
    require("nvim-treesitter.configs").setup({})

    -- Then setup context commentstring
    require("ts_context_commentstring").setup({})

    -- Finally configure Comment.nvim
    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      toggler = {
        line = "<leader>cc",
        block = "<leader>bc",
      },
      opleader = {
        line = "<leader>c",
        block = "<leader>b",
      },
      extra = {
        eol = "<leader>cA",
      },
    })
  end,
}
