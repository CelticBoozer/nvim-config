-- INFO: LSP/DAP/linter/formatter package manager
-- NOTE: Centralized dependency management for development tools.

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
    -- Setup Mason core with UI and installation settings
    require("mason").setup(opts)

    -- Configure Mason LSPconfig to ensure necessary LSP servers are installed automatically
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

    -- Configure Mason Tool Installer to manage external development tools
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- Linters
        "ruff",
        "checkstyle",
        "cspell",
        "eslint_d",
        "hadolint",
        "jsonlint",
        "luacheck",
        "markdownlint",
        "shellcheck",
        "sqlfluff",
        "stylelint",
        "yamllint",
        -- Formatters
        "stylua",
        "shfmt",
        "yamlfmt",
        "prettier",
        "google-java-format",
        "sql-formatter",
        "xmlformatter",
        -- DAP Tools
        "firefox-debug-adapter",
        "debugpy",
        "bash-debug-adapter",
      },
    })
  end,
}
