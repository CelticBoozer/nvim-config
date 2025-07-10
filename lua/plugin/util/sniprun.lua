-- INFO: Runs code snippent independently
-- NOTE: Provides result in notification

return {
  "michaelb/sniprun",
  keys = {
    { "<leader>es", "<cmd>SnipRun<cr>", desc = "Run snippet", mode = "v" },
  },
  opts = {
    display = { "NvimNotify" },
  },
}
