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
      layout_strategy = "horizontal",
      layout_config = {
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
