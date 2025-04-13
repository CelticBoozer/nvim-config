-- INFO: Core LSP configuration and integrations
-- NOTE: Provides language-aware features and server management

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason-lspconfig.nvim",
  },
  opts = {
    capabilities = function()
      local caps = require("cmp_nvim_lsp").default_capabilities()
      caps.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }
      return caps
    end,

    signs = {
      Error = "",
      Warn = "",
      Hint = "",
      Info = "",
    },

    servers = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = { checkThirdParty = false },
          },
        },
      },
      bashls = {},
      cssls = {},
      dockerls = {},
      docker_compose_language_service = {},
      eslint = {},
      groovyls = {},
      html = {},
      jdtls = {},
      jsonls = {},
      lemminx = {},
      marksman = {},
      sqlls = {},
      taplo = {},
      ts_ls = {},
      yamlls = {},
      pylsp = {},
    },
  },
  config = function(_, opts)
    -- Configure diagnostic signs
    for type, icon in pairs(opts.signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- Configure LSP servers
    local lspconfig = require("lspconfig")
    local capabilities = opts.capabilities()

    for server, config in pairs(opts.servers) do
      lspconfig[server].setup(vim.tbl_deep_extend("force", {
        capabilities = capabilities,
      }, config))
    end
  end,
}
