-- INFO: Fuzzy finder with advanced preview capabilities.
-- NOTE: Unified interface for file navigation and system exploration.

return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "lpoto/telescope-docker.nvim",
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-h>"] = require("telescope.actions").which_key,
          ["<C-s>"] = require("telescope.actions").select_vertical,
          ["<C-x>"] = require("telescope.actions").select_horizontal,
        },
        n = {
          s = require("telescope.actions").select_vertical,
          S = require("telescope.actions").select_horizontal,
          t = require("telescope.actions").select_tab,
        },
      },
      layout_strategy = "horizontal",
      layout_config = {
        preview_width = 0.6,
        width = 0.95,
        height = 0.85,
      },
      file_ignore_patterns = {
        "node_modules",
        ".git",
        ".cache",
        "%.jpg",
        "%.png",
      },
    },
    extensions = {
      media_files = {
        filetypes = { "png", "webp", "jpg", "jpeg", "pdf" },
        find_cmd = "rg",
      },
      docker = {
        hidden = false,
      },
      undo = {
        use_delta = true,
        side_by_side = true,
      },
    },
  },
}
