-- INFO: Asynchronous linting integration
-- NOTE: Provides real-time code analysis for various languages

return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
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
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      css = { "stylelint" },
      java = { "checkstyle" },
      sql = { "sqlfluff" },
      markdown = { "markdownlint", "cspell" },
      ["*"] = { "cspell" },
    },
  },
  config = function(_, opts)
    local lint = require("lint")

    -- Configure linters
    lint.linters_by_ft = opts.linters_by_ft
    for name, config in pairs(opts.linters or {}) do
      lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name] or {}, config)
    end

    -- Setup automatic linting
    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      callback = function()
        lint.try_lint()
      end,
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
    })
  end,
}
