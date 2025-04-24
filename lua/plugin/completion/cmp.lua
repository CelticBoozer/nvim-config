-- INFO: .env file completions
-- NOTE: Provides environment variable suggestions for .env files

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
        -- You can comment out the global dotenv source if you want it only in .env files:
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

    -- Optional: if you want dotenv completions only for .env files, you can remove it from the
    -- global sources list above and add it here:
    --
    -- cmp.setup.filetype("env", {
    --   sources = {
    --     { name = "dotenv" },
    --   },
    -- })
  end,
}
