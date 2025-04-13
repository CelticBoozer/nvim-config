-- INFO: Interactive LSP rename with live preview
-- NOTE: Provides real-time renaming previews
-- Dependencies:
-- - 'stevearc/dressing.nvim': Improved UI components

-- luacheck: globals vim
-- luacheck: ignore 113

return {
  "smjonas/inc-rename.nvim",
  event = "LspAttach",
  dependencies = {
    "stevearc/dressing.nvim",
  },
  keys = {
    {
      "<leader>rn",
      ":IncRename ",
      desc = "Rename symbol",
      mode = "n",
    },
  },
  opts = {
    input_buffer_type = "dressing",
    preview_empty_name = false,
    show_hl_groups = true,
    hl_group = "Substitute",
    preview_prefix = "➤ ",
    cmd_name = "IncRename",
    borders = "rounded",
    clean_postfix_space = true,
  },
}
