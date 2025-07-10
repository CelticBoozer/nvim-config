-- NOTE: Core initialization file for Neovim configuration. Requires and sets up modules.

require("core.options")
require("core.lazy")
require("core.functions")

-- Safe telescope extension loading
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyDone",
  callback = function()
    pcall(function()
      require("telescope").load_extension("media_files")
      require("telescope").load_extension("docker")
      require("telescope").load_extension("undo")
    end)
  end,
})
