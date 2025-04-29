-- INFO: Automatic bracket/parenthesis completion
-- NOTE: Smart pair management with LSP/cmp integration.

return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  opts = {
    check_ts = true,
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    ignored_next_char = "[%w%.]", -- Don't pair if next char is alphanumeric or dot
    fast_wrap = {
      map = "<M-e>",
      offset = -1,
    },
    map_cr = false,
  },
}
