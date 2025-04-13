-- INFO: LSP/DAP/linter/formatter package manager
-- NOTE: Centralized dependency management for development tools

return {
  "williamboman/mason.nvim",
  lazy = false,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  opts = {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
      border = "rounded",
      height = 0.8,
    },
    -- Shared installation config
    install_root_dir = vim.fn.stdpath("data") .. "/mason",
    max_concurrent_installers = 4,
  },
  config = function(_, opts)
    -- Setup Mason core
    require("mason").setup(opts)

    -- Setup LSP config
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pylsp",
        "lua_ls",
        "marksman",
        "dockerls",
        "bashls",
        "jsonls",
        "yamlls",
        "taplo",
        "html",
        "cssls",
        "eslint",
        "ts_ls",
        "jdtls",
        "groovyls",
        "sqlls",
        "lemminx",
      },
      automatic_installation = true,
    })

    -- Setup tools installer
    require("mason-tool-installer").setup({
      ensure_installed = {
        "luacheck",
        "hadolint",
        "shellcheck",
        "jsonlint",
        "yamllint",
        "eslint_d",
        "stylelint",
        "checkstyle",
        "sqlfluff",
        "markdownlint",
        "cspell",
        "stylua",
        "shfmt",
        "yamlfmt",
        "prettier",
        "google-java-format",
        "sql-formatter",
        "xmlformatter",
        "firefox-debug-adapter",
        "debugpy",
        "bash-debug-adapter",
      },
    })
  end,
}
