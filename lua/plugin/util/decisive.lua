-- INFO: Enhances CSV editing by aligning columns using virtual text.
-- NOTE: Utilizes Neovim 0.10+'s inline extmarks feature for non-intrusive column alignment.

return {
  "emmanueltouzery/decisive.nvim",
  lazy = false,
  ft = { "csv" },
  dependencies = {},
  keys = {
    {
      "<leader>cca",
      ":lua require('decisive').align_csv({})<cr>",
      { silent = true },
      desc = "Align CSV",
      mode = "n",
    },
    {
      "<leader>ccA",
      ":lua require('decisive').align_csv_clear({})<cr>",
      { silent = true },
      desc = "Align CSV clear",
      mode = "n",
    },
    {
      "[c",
      ":lua require('decisive').align_csv_prev_col()<cr>",
      { silent = true },
      desc = "Align CSV prev col",
      mode = "n",
    },
    {
      "]c",
      ":lua require('decisive').align_csv_next_col()<cr>",
      { silent = true },
      desc = "Align CSV next col",
      mode = "n",
    },
  },
  opts = {
    auto_realign = true,
    even_highlight = "DecisiveEven",
    odd_highlight = "DecisiveOdd",
  },
}
