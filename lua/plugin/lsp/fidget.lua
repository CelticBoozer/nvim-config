-- NOTE: UI enhancements for LSP progress notifications
-- Dependencies: None explicitly required, integrates with LSP clients

return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  opts = {
    progress = {
      display = {
        done_icon = "✔", -- Custom icon for completed tasks
        progress_icon = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
      },
    },
    notification = {
      window = {
        winblend = 10, -- Transparency
        border = "rounded", -- Rounded borders for a modern look
      },
    },
    logger = {
      level = vim.log.levels.WARN, -- Show warnings and errors only
    },
  },
}
