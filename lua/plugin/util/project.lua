-- INFO: Project management with telescope
-- NOTE: Provides project detection and management

return {
  "ahmedkhalf/project.nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("project_nvim").setup({
      detection_methods = { "pattern", "lsp" },

      -- Project patterns to detect (defaults to common VCS roots)
      patterns = {
        ".git",
        "package.json",
        "Cargo.toml",
        "Makefile",
        "*.sln",
        "pyproject.toml",
      },

      -- Ignore directories (e.g., build folders)
      ignore_lsp = { "null-ls", "efm" },
      exclude_dirs = { "**/node_modules/**", "**/.build/**", "**/target/**" },

      -- Show hidden files in telescope
      show_hidden = false,

      -- Manual mode (don't auto-detect projects)
      manual_mode = false,

      -- Telescope theme configuration
      telescope = {
        theme = "dropdown",
        previewer = false,
        layout_config = {
          width = 0.3,
          height = 0.4,
        },
      },

      -- Session management integration
      silent_chdir = true,
      datapath = vim.fn.stdpath("data"),
    })

    vim.keymap.set("n", "<leader>sp", function()
      vim.cmd("SessionSave")
      require("project_nvim").add_project()
    end, { desc = "Save session and add project" })
  end,
}
