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
        "bashls",
        "cssls",
        "docker_compose_language_service",
        "dockerls",
        "eslint",
        "groovyls",
        "html",
        "jdtls",
        "jsonls",
        "lemminx",
        "lua_ls",
        "marksman",
        "ruff",
        "sqlls",
        "taplo",
        "yamlls",
      },
      automatic_installation = true,
    })

    -- Configure Mason Tool Installer to manage external development tools
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- Linters
        "checkstyle",
        "cspell",
        "eslint_d",
        "hadolint",
        "jsonlint",
        "luacheck",
        "markdownlint",
        "npm-groovy-lint",
        "ruff",
        "shellcheck",
        "sqlfluff",
        "stylelint",
        "yamllint",
        -- Formatters
        "google-java-format",
        "prettier",
        "shfmt",
        "stylua",
        "xmlformatter",
        "yamlfmt",
        -- DAP Tools
        "bash-debug-adapter",
        "debugpy",
        "firefox-debug-adapter",
      },
    })
  end,
}
