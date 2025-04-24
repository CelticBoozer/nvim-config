-- INFO:Plugin that provides a highly customizable code suggestion  engine.
-- NOTE: Uses LSP to provide code suggestions.

return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-l>",
        clear_suggestion = "<C-h>",
        accept_word = "<C-j>",
      },
      color = {
        suggestion_color = "#7daea3",
        cterm = 244,
      },
      log_level = "info",
      condition = function()
        return false
      end,
    })
  end,
}
