-- INFO: Execute code snippets or files directly within Neovim.
-- NOTE: Supports multiple languages and integrates with betterTerm.nvim for terminal management.

return {
  "CRAG666/code_runner.nvim",
  cmd = { "RunCode", "RunFile", "RunProject" },
  keys = {
    { "<leader>er", "<cmd>RunCode<CR>", desc = "Run code" },
    { "<leader>ef", "<cmd>RunFile<CR>", desc = "Run file" },
    { "<leader>ep", "<cmd>RunProject<CR>", desc = "Run project" },
  },
  opts = {
    mode = "term",
    startinsert = true,
    term = {
      position = "bot",
      size = 15,
    },
  },
}
