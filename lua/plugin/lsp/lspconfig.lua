-- INFO: LSP configuration
-- luacheck:ignore 212
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  keys = {},
  opts = {
    setup = {
      lspconfig = {
        ui = {
          border = "rounded",
        },
        -- Default capabilities with folding
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
      },
    },
    -- Server-specific configurations
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
    -- Set UI border
    require("lspconfig.ui.windows").default_options.border = opts.setup.lspconfig.ui.border

    -- Set diagnostic signs
    for type, icon in pairs(opts.setup.lspconfig.signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- Set up servers with common configuration
    local lspconfig = require("lspconfig")
    local default_capabilities = opts.setup.lspconfig.capabilities()
    local default_on_attach = opts.setup.lspconfig.on_attach

    for server, server_opts in pairs(opts.servers) do
      lspconfig[server].setup(vim.tbl_deep_extend("force", {
        capabilities = default_capabilities,
        on_attach = default_on_attach,
      }, server_opts))
    end

    -- Additional visual customization
    vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "#d4be98" })
  end,
}
