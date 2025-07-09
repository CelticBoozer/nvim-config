-- INFO: Enhanced tab/buffer management interface
-- NOTE: Provides visual navigation through open buffers with icons and diagnostics

return {
  "akinsho/bufferline.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Just pretty icons
  opts = {
    options = {
      mode = "tabs",
      themable = true,
      numbers = "ordinal",
      right_mouse_command = false,
      indicator = {
        style = "underline",
      },
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level)
        local icons = {
          error = " ",
          warning = " ",
          info = " ",
          hint = " ",
        }
        return (icons[level] or "?") .. count
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "left",
          separator = true,
        },
      },
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
      show_tab_indicators = false,
      show_duplicate_prefix = true,
      separator_style = "slope",
      enforce_regular_tabs = false,
      always_show_bufferline = false,
      hover = {
        enabled = true,
        delay = 100,
        reveal = { "close" },
      },
    },
    highlights = {
      fill = {
        fg = "#d4be98",
        bg = "#32302f",
      },
      background = {
        fg = "#7c6f64",
        bg = "#252423",
      },
      close_button = {
        fg = "#7c6f64",
        bg = "#252423",
      },
      close_button_selected = {
        fg = "#d4be98",
        bg = "#7c6f64",
      },
      buffer_selected = {
        fg = "#d4be98",
        bg = "#7c6f64",
        bold = true,
        italic = true,
      },
      numbers = {
        fg = "#7c6f64",
        bg = "#252423",
      },
      numbers_selected = {
        fg = "#d4be98",
        bg = "#7c6f64",
        bold = true,
        italic = true,
      },
      hint = {
        fg = "#a9b665",
        bg = "#252423",
        sp = "#a9b665",
      },
      hint_selected = {
        fg = "#a9b665",
        bg = "#7c6f64",
        sp = "#a9b665",
        bold = true,
        italic = true,
      },
      hint_diagnostic = {
        fg = "#a9b665",
        bg = "#252423",
        sp = "#a9b665",
      },
      hint_diagnostic_selected = {
        fg = "#a9b665",
        bg = "#7c6f64",
        sp = "#a9b665",
        bold = true,
        italic = true,
      },
      info = {
        fg = "#89b482",
        bg = "#252423",
        sp = "#89b482",
      },
      info_selected = {
        fg = "#89b482",
        bg = "#7c6f64",
        sp = "#89b482",
        bold = true,
        italic = true,
      },
      info_diagnostic = {
        fg = "#89b482",
        bg = "#252423",
        sp = "#89b482",
      },
      info_diagnostic_selected = {
        fg = "#89b482",
        bg = "#7c6f64",
        sp = "#89b482",
        bold = true,
        italic = true,
      },
      warning = {
        fg = "#d8a657",
        bg = "#252423",
        sp = "#d8a657",
      },
      warning_selected = {
        fg = "#d8a657",
        bg = "#7c6f64",
        sp = "#d8a657",
        bold = true,
        italic = true,
      },
      warning_diagnostic = {
        fg = "#d8a657",
        bg = "#252423",
        sp = "#d8a657",
      },
      warning_diagnostic_selected = {
        fg = "#d8a657",
        bg = "#7c6f64",
        sp = "#d8a657",
        bold = true,
        italic = true,
      },
      error = {
        fg = "#ea6962",
        bg = "#252423",
        sp = "#ea6962",
      },
      error_selected = {
        fg = "#ea6962",
        bg = "#7c6f64",
        sp = "#ea6962",
        bold = true,
        italic = true,
      },
      error_diagnostic = {
        fg = "#ea6962",
        bg = "#252423",
        sp = "#ea6962",
      },
      error_diagnostic_selected = {
        fg = "#ea6962",
        bg = "#7c6f64",
        sp = "#ea6962",
        bold = true,
        italic = true,
      },
      modified = {
        fg = "#a9b665",
        bg = "#252423",
      },
      modified_selected = {
        fg = "#a9b665",
        bg = "#7c6f64",
      },
      duplicate = {
        fg = "#7c6f64",
        bg = "#252423",
        italic = true,
      },
      duplicate_selected = {
        fg = "#d4be98",
        bg = "#7c6f64",
        italic = true,
      },
      separator = {
        fg = "#252423",
        bg = "#252423",
      },
      separator_selected = {
        fg = "#252423",
        bg = "#7c6f64",
      },
    },
  },
}
