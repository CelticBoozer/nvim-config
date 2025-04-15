-- INFO: Notification plugin to replace vim.notify with a fancy floating notification system.
-- NOTE: Replaces default notifications with a configurable, animated notification popup.

return {
  "rcarriga/nvim-notify",
  lazy = false,
  dependencies = {},
  keys = {},
  opts = {
    stages = "fade_in_slide_out",
    timeout = 3000,
    max_height = function()
      return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.75)
    end,
    top_down = true,
    background_colour = "#252423",
  },

  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)
    vim.notify = notify
  end,
}
