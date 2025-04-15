-- INFO: SQL language support via LSP
-- NOTE: Requires Neovim 0.10+ and the sqls language server

return {
  "nanotee/sqls.nvim",
  ft = { "sql" },
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    local lspconfig = require("lspconfig")
    local sqls = require("sqls")

    lspconfig.sqls.setup({
      on_attach = function(client, bufnr)
        sqls.on_attach(client, bufnr)
      end,
    })
  end,
}
