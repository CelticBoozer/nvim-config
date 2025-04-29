-- INFO: Gruvbox Material colorscheme configuration
-- NOTE: Customized soft background variant with UI enhancements

return {
  "sainnhe/gruvbox-material",
  lazy = false,
  priority = 1000,
  opts = {
    background = "soft",
    foreground = "material",
    transparent_background = 2,
    sign_column_background = "grey",
    statusline_style = "default",
    ui_contrast = "low",
    diagnostic_line_highlight = 1,
    disable_terminal_colors = 1,
    enable_bold = 1,
    enable_italic = 1,
    better_performance = 1,
  },
  config = function(_, opts)
    -- Apply theme options
    for option, value in pairs(opts) do
      vim.g["gruvbox_material_" .. option] = value
    end
    -- Set colorscheme
    vim.cmd.colorscheme("gruvbox-material")
    -- Custom float window styling
    vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#d4be98" })
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#d4be98" })
  end,
}
