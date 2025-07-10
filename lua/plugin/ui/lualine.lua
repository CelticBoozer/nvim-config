-- INFO: Customizable status line with real-time diagnostics
-- NOTE: Provides contextual information and mode awareness

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "linrongbin16/lsp-progress.nvim",
      opts = {
        client_format = function(client_name, spinner, series_messages)
          local sign = " "
          return #series_messages > 0
              and (string.format("%s%s %s %s", sign, spinner, client_name, table.concat(series_messages, " ")))
            or ""
        end,
      },
    },
  },
  opts = {
    options = {
      theme = "gruvbox-material",
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "alpha", "dashboard" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        "diff",
        {
          "diagnostics",
          symbols = {
            error = " ",
            warn = " ",
            info = " ",
            hint = " ",
          },
        },
      },
      lualine_c = {
        {
          "filename",
          path = 1,
          symbols = {
            modified = " ",
            readonly = " ",
            unnamed = " ",
          },
        },
        {
          function()
            return require("lsp-progress").progress()
          end,
        },
      },
      lualine_x = {
        {
          "searchcount",
          maxcount = 999,
        },
        "encoding",
        "fileformat",
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    extensions = { "neo-tree", "lazy" },
  },
  config = function(_, opts)
    require("lualine").setup(opts)

    vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      group = "lualine_augroup",
      pattern = "LspProgressStatusUpdated",
      callback = require("lualine").refresh,
    })
  end,
}
