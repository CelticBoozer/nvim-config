-- INFO: Session management with automatic save and restore
-- NOTE: Ensures session persistence across restarts and integrates with Telescope

return {
  "rmagatti/auto-session",
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<leader>sl", "<cmd>Telescope session-lens search_session<cr>", desc = "Search sessions" },
    { "<leader>ss", "<cmd>SessionSave<cr>", desc = "Save session" },
    { "<leader>sr", "<cmd>SessionRestore<cr>", desc = "Restore session" },
  },
  config = function()
    require("auto-session").setup({
      {
        auto_restore = true,
        auto_restore_last_session = false,
        auto_save = true,
        log_level = "info",
        session_lens = {
          load_on_setup = true,
          mappings = {
            delete_session = { "n", "d" },
          },
        },
        show_auto_restore_notif = true,
      },
    })

    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

    require("telescope").load_extension("session-lens")
  end,
}
