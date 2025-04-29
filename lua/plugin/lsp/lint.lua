-- INFO: Asynchronous linting integration
-- NOTE: Provides real-time code analysis for various languages.

return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
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

    -- Configure linters for each filetype
    lint.linters_by_ft = opts.linters_by_ft

    -- Extend existing linter configurations if 'opts.linters' is provided
    for name, conf in pairs(opts.linters or {}) do
      lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name] or {}, conf)
    end

    -- Setup automatic linting on buffer write and insert leave
    vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
      group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
