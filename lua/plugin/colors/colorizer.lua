-- INFO: Real-time color code highlighting
-- NOTE: Displays color previews for hex codes, RGB values, and named colors

return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    ["*"] = { -- Default settings for all filetypes
      RGB = true,
      names = true,
      RRGGBBAA = true,
      virtualtext = "■",
    },
    css = {
      mode = "background",
      sass = { enable = true },
    },
    html = {
      mode = "foreground",
      names = false,
    },
    javascript = {
      mode = "background",
      tailwind = true,
    },
  },
}
