return {
  "folke/which-key.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.icons",
  },
  keys = {
    {
      "<leader><leader>",
      ":WhichKey<CR>",
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    wk.register({
      ["<leader>"] = {
        f = {
          name = "Find",
        }
      }
    })
  end,
}
