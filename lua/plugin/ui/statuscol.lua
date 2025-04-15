-- INFO: Interactive status column with fold indicators
-- NOTE: Provides clickable line numbers and fold markers

return {
  "luukvbaal/statuscol.nvim",
  event = "VeryLazy",
  dependencies = { "kevinhwang91/nvim-ufo" },
  opts = {
    setopt = true,
    relculright = true,
    segments = {
      {
        text = { "%C" },
        click = "v:lua.ScFa",
        condition = { true },
        hl = "FoldColumn",
      },
      {
        text = { "%s" },
        click = "v:lua.ScSa",
        hl = "SignColumn",
      },
      {
        text = { " ", "", " " },
        click = "v:lua.ScLa",
        hl = { "LineNr", "Comment" },
        condition = { true },
      },
    },
  },
}
