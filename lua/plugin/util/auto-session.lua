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
    { "<leader>sd", "<cmd>SessionDelete<cr>", desc = "Delete session" },
  },
  config = function()
    require("auto-session").setup({
      log_level = "info",
      auto_session_enable_last_session = false,
      auto_save = true,
      auto_restore = true,
      show_auto_restore_notif = true,
      session_lens = {
        load_on_setup = true,
        mappings = {
          delete_session = { "n", "d" },
        },
      },
    })

    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

    require("telescope").load_extension("session-lens")
  end,
}
