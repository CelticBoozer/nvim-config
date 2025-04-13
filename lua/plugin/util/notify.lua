-- INFO: Notification plugin to replace vim.notify with a fancy floating notification system.
-- NOTE: Replaces default notifications with a configurable, animated notification popup.

return {
  -- 1. Plugin address.
  "rcarriga/nvim-notify",

  -- 2. lazy: load immediately (or adjust as needed).
  lazy = false,

  -- 3. (No event required for this plugin)

  -- 4. Dependencies: none.
  dependencies = {},

  -- 5. Keys: (this plugin does not define key mappings by default).
  keys = {},

  -- 6. opts: Configuration options for nvim-notify.
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
    background_colour = "#1e222a",
  },

  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)
    vim.notify = notify
  end,
}
