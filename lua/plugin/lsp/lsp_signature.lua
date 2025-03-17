-- NOTE: Show function signatures as you type for better LSP experience

return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    bind = true,
    hint_enable = true,
    floating_window = true,
    handler_opts = {
      border = "rounded",
    },
  },
}
