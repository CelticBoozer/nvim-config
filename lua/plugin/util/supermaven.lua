-- INFO:Plugin that provides a highly customizable code suggestion  engine.
-- NOTE: Uses LSP to provide code suggestions.

return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      log_level = "info",
      disable_inline_completion = true,
      condition = function()
        return false
      end,
    })
  end,
}
