-- init.lua
require("core.options")

-- Bootstrap and setup lazy.nvim through its own plugin spec
require("plugin.lazy")

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
