-- INFO: Provides an interactive Git interface within Neovim, inspired by Magit.
-- NOTE: Enhances Git operations directly from Neovim without leaving the editor.

return {
  "NeogitOrg/neogit",
  lazy = false,
  cmd = { "Neogit" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Open Neogit" },
  },

  opts = {
    disable_hint = false,
    disable_context_highlighting = false,
    disable_signs = false,
    prompt_force_push = true,
    disable_insert_on_commit = "auto",
    filewatcher = {
      interval = 1000,
      enabled = true,
    },
    graph_style = "kitty",
    use_default_keymaps = true,
    auto_refresh = true,
    kind = "floating",
    disable_line_numbers = true,
    disable_relative_line_numbers = true,
    console_timeout = 2000,
    auto_show_console = true,
    auto_close_console = true,
    notification_icon = "",
    status = {
      show_head_commit_hash = true,
      recent_commit_count = 10,
      HEAD_padding = 10,
      HEAD_folded = false,
      mode_padding = 3,
      mode_text = {
        M = "modified",
        N = "new file",
        A = "added",
        D = "deleted",
        C = "copied",
        U = "updated",
        R = "renamed",
        DD = "unmerged",
        AU = "unmerged",
        UD = "unmerged",
      },
    },
    integrations = {
      diffview = true,
    },
    highlight = {
      italic = true,
      bold = true,
      underline = true,
    },
    remember_settings = true,
    use_per_project_settings = true,
    ignored_settings = {
      "NeogitPushPopup--force-with-lease",
      "NeogitPushPopup--force",
      "NeogitPullPopup--rebase",
      "NeogitCommitPopup--allow-empty",
      "NeogitRevertPopup--no-edit",
    },
    git_services = {
      ["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
      ["bitbucket.org"] = "https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1",
      ["gitlab.com"] = "https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}",
      ["azure.com"] = "https://dev.azure.com/${owner}/_git/${repository}/pullrequestcreate?sourceRef=${branch_name}&targetRef=${target}",
    },
    telescope_sorter = function()
      return require("telescope").extensions.fzf.native_fzf_sorter()
    end,
  },
}
