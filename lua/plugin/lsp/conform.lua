-- INFO: Unified file formatting interface
-- NOTE: Handles code formatting through LSP and external tools.

return {
  "stevearc/conform.nvim",
  lazy = false,
  event = { "BufReadPre", "BufNewFile", "BufWrite" },
  keys = {
    {
      "<leader>rf",
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
      java = { "google-java-format" },
      markdown = { "markdownlint" },
      groovy = { "npm-groovy-lint" },
      html = { "prettier" },
      css = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      svelte = { "prettier" },
      graphql = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      python = { "ruff" },
      sh = { "shfmt" },
      sql = { "sqlfluff" },
      lua = { "stylua" },
      toml = { "taplo" },
      xml = { "xmlformatter" },
      yaml = { "yamlfmt" },
      ["_"] = { "trim_whitespace" },
    },
    formatters = {
      trim_whitespace = {
        command = "sed",
        args = { "-i", "s/[[:space:]]*$//" },
      },
    },
  },
}
