-- INFO: Unified file formatting interface
-- NOTE: Handles code formatting through LSP and external tools

return {
  "stevearc/conform.nvim",
  lazy = false,
  event = { "BufReadPre", "BufNewFile", "BufWrite" },
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format({
          lsp_fallback = true,
          async = true,
          timeout_ms = 1000,
        })
      end,
      desc = "Format file",
      mode = { "n", "v" },
    },
  },
  opts = {
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      python = { "ruff" },
      lua = { "stylua" },
      markdown = { "markdownlint" },
      sh = { "shfmt" },
      json = { "jsonlint" },
      yaml = { "yamllint" },
      html = { "prettier" },
      css = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      svelte = { "prettier" },
      java = { "google-java-format" },
      graphql = { "prettier" },
      sql = { "sqlfluff" },
      xml = { "xmlformatter" },
      ["*"] = { "codespell" },
      ["_"] = { "trim_whitespace" },
    },
    formatters = {
      codespell = {
        command = "codespell",
        args = { "--write-changes", "$FILENAME" },
      },
      trim_whitespace = {
        command = "sed",
        args = { "-i", "s/[[:space:]]*$//" },
      },
    },
  },
}
