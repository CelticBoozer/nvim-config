-- INFO: Autocompletion configuration using nvim-cmp with integrations for LSP, snippets, and other completion sources.
-- NOTE: This configuration integrates nvim-autopairs, custom formatting, and provides experimental ghost text.

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim",
    "windwp/nvim-autopairs",
    "SergioRibera/cmp-dotenv",
  },
  config = function()
    local cmp = require("cmp")

    -- Initialize autopairs integration for automatic closing.
    require("nvim-autopairs").setup()
    cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())

    cmp.setup({
      mapping = {
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "dotenv" },
        { name = "supermaven" },
      },
      formatting = {
        format = require("lspkind").cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      experimental = {
        ghost_text = {
          hl_group = "Comment",
        },
      },
    })
  end,
}
