-- INFO: lazygit is a git client for neovim.
-- NOTE: Plugin needs original lazygit to work.

return {
  "kdheepak/lazygit.nvim",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>tg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
}
