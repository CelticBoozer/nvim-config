-- NOTE: Provides linting support for various filetypes

return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {
      "<leader>ll",
      function()
        require("lint").try_lint()
      end,
      desc = "Lint file",
    },
  },
  opts = {
    linters_by_ft = {
      python = { "ruff" },
      lua = { "luacheck" },
      dockerfile = { "hadolint" },
      sh = { "shellcheck" },
      json = { "jsonlint" },
      yaml = { "yamllint" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      css = { "stylelint" },
      java = { "checkstyle" },
      sql = { "sqlfluff" },
      markdown = { "markdownlint" },
    },
  },
  config = function(_, opts)
    local lint = require("lint")

    lint.linters_by_ft = opts.linters_by_ft

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
        lint.try_lint("cspell") -- Ensure cspell is always run
      end,
    })
  end,
}
