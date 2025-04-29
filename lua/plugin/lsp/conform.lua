-- INFO: Unified file formatting interface
-- NOTE: Handles code formatting through LSP and external tools.
-- External Dependencies: "sed" (for trim_whitespace formatting) and external formatters (ruff, stylua, prettier, etc.)
-- Installed via lazy.nvim:
--   • stevearc/conform.nvim

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
      python = { "ruff" },
      lua = { "stylua" },
      markdown = { "markdownlint" },
      sh = { "shfmt" },
      json = { "prettier" },
      yaml = { "yamlfmt" },
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
