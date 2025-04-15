-- INFO: Enhanced command-line interface
-- NOTE: Provides a floating command palette with history

return {
  "VonHeikemen/fine-cmdline.nvim",
  keys = {
    { ":", "<cmd>FineCmdline<CR>", desc = "Open command palette", mode = "n" },
  },
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    cmdline = {
      enable_keymaps = true,
      smart_history = true,
      prompt = " 󰘳 ",
    },
    popup = {
      position = {
        row = "20%",
        col = "50%",
      },
      size = {
        width = "40%",
        min_width = 40,
        max_width = 80,
        height = "auto",
      },
      border = {
        style = "rounded",
      },
    },
  },
}
