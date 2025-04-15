-- INFO: Start screen plugin providing a customizable dashboard interface.
-- NOTE: Displays a dashboard with shortcuts and recent files/projects upon launching Neovim.

return {
  "nvimdev/dashboard-nvim",
  lazy = false,
  event = "VimEnter",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  keys = {},
  opts = {
    theme = "hyper",
    config = {
      header = {
        "",
        " ██████╗███████╗██╗  ████████╗██╗ ██████╗██╗   ██╗██╗███╗   ███╗",
        "██╔════╝██╔════╝██║  ╚══██╔══╝██║██╔════╝██║   ██║██║████╗ ████║",
        "██║     █████╗  ██║     ██║   ██║██║     ██║   ██║██║██╔████╔██║",
        "██║     ██╔══╝  ██║     ██║   ██║██║     ╚██╗ ██╔╝██║██║╚██╔╝██║",
        "╚██████╗███████╗███████╗██║   ██║╚██████╗ ╚████╔╝ ██║██║ ╚═╝ ██║",
        " ╚═════╝╚══════╝╚══════╝╚═╝   ╚═╝ ╚═════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
        "",
      },
      shortcut = {
        {
          desc = "󰈮 Files",
          group = "Orange",
          action = "Telescope find_files",
          key = "f",
        },
        {
          desc = " Plugins",
          group = "Aqua",
          action = "Lazy update",
          key = "u",
        },
        {
          desc = " LSP",
          group = "Aqua",
          action = "Mason",
          key = "s",
        },
      },
      project = {
        enable = true,
        icon = " ",
        label = " Recent project",
        limit = 8,
        action = "Telescope find_files cwd=",
      },
      mru = {
        enable = true,
        icon = " ",
        label = " Recent files",
        limit = 10,
        cwd_only = false,
      },
    },
  },
  config = function(_, opts)
    require("dashboard").setup(opts)
    local set_hl = vim.api.nvim_set_hl
    set_hl(0, "DashboardProjectIcon", { fg = "#a9b665" })
    set_hl(0, "DashboardProjectTitle", { fg = "#d8a657" })
    set_hl(0, "DashboardProjectTitleIcon", { fg = "#d8a657" })
    set_hl(0, "DashboardMruIcon", { fg = "#d8a657" })
    set_hl(0, "DashboardMruTitle", { fg = "#d8a657" })
  end,
}
