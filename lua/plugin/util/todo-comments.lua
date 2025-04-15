-- INFO: Highlight and manage todo comments
-- NOTE: Visualize todos with colored icons and diagnostics

return {
  "folke/todo-comments.nvim",
  event = "BufReadPost",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {
      FIX = { icon = " ", color = "fix" },
      TODO = { icon = " ", color = "todo" },
      HACK = { icon = " ", color = "hack" },
      WARN = { icon = " ", color = "warn" },
      PERF = { icon = "󰅒 ", color = "perf" },
      NOTE = { icon = "󰎞 ", color = "note" },
      TEST = { icon = "󰙨 ", color = "test" },
    },
    colors = {
      error = { "DiagnosticError" },
      warning = { "DiagnosticWarn" },
      info = { "DiagnosticInfo" },
      hint = { "DiagnosticHint" },
      default = { "Comment" },
      fix = "#ea6962",
      todo = "#e78a4e",
      hack = "#d8a657",
      warn = "#d8a657",
      perf = "#7daea3",
      note = "#89b482",
      test = "#d3869b",
    },
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*]],
      keyword = "bg",
      after = "fg",
    },
    search = {
      pattern = [[\b(KEYWORDS)\b]],
    },
  },
}
