-- INFO: Interactive function signature help during typing
-- NOTE: Displays parameter information and documentation

return {
  "ray-x/lsp_signature.nvim",
  event = "LspAttach",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  opts = {
    hint_prefix = "󰛩 ", -- Custom hint indicator
    extra_trigger_chars = { "(", ",", "<" }, -- Added angle bracket
  },
}
