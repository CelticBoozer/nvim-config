-- INFO: Advanced syntax parsing and highlighting
-- NOTE: Provides better code understanding and manipulation

return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "bash",
      "css",
      "dockerfile",
      "html",
      "java",
      "javascript",
      "json",
      "lua",
      "markdown",
      "python",
      "sql",
      "toml",
      "typescript",
      "yaml",
    },
    auto_install = true,
    highlight = {
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
  },
}
