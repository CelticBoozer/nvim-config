-- INFO: Extensible framework for interacting with tests within Neovim
-- NOTE: Requires appropriate test adapters for your specific language/framework

return {
  "nvim-neotest/neotest",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Adapters for supported languages
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-jest",
    "rouge8/neotest-rust",
    "rcasia/neotest-bash",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
        }),
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        }),
        require("neotest-rust"),
        require("neotest-bash"),
      },
    })
  end,
}
