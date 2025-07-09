-- INFO: yanky.nvim is great clipboard manager
-- NOTE: Use it as a telescope picker

return {
  "gbprod/yanky.nvim",
  dependencies = {
    { "kkharji/sqlite.lua" },
  },
  opts = {
    ring = { storage = "sqlite" },
  },
  config = function()
    local utils = require("yanky.utils")
    local mapping = require("yanky.telescope.mapping")

    require("yanky").setup({
      picker = {
        telescope = {
          mappings = {
            default = mapping.put("p"),
            i = {
              ["<c-p>"] = mapping.put("p"),
              ["<c-P>"] = mapping.put("P"),
              ["<c-d>"] = mapping.delete(),
              ["<c-y>"] = mapping.set_register(utils.get_default_register()),
            },
            n = {
              p = mapping.put("p"),
              P = mapping.put("P"),
              d = mapping.delete(),
              y = mapping.set_register(utils.get_default_register()),
            },
          },
        },
      },
    })
  end,
}
