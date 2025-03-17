-- NOTE: Configure Language Server Protocol (LSP) support in Neovim
-- Provides auto-completion, diagnostics, and language-specific features

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  keys = {},
  opts = {
    -- Default capabilities with folding support
    capabilities = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      return capabilities
    end,

    -- Diagnostic signs
    signs = {
      Error = "",
      Warn = "",
      Hint = "",
      Info = "",
    },

    -- List of LSP servers to configure
    servers = {
      lua_ls = {},
      marksman = {},
      dockerls = {},
      docker_compose_language_service = {},
      bashls = {},
      jsonls = {},
      yamlls = {},
      taplo = {},
      html = {},
      cssls = {},
      eslint = {},
      ts_ls = {},
      jdtls = {},
      groovyls = {},
      sqlls = {},
      lemminx = {},
    },
  },
  config = function(_, opts)
    -- Set diagnostic signs
    for type, icon in pairs(opts.signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- Set up LSP servers
    local lspconfig = require("lspconfig")
    local capabilities = opts.capabilities()

    for server, server_opts in pairs(opts.servers) do
      lspconfig[server].setup(vim.tbl_deep_extend("force", {
        capabilities = capabilities,
      }, server_opts))
    end
  end,
}
