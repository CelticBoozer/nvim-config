-- INFO: Plugin manager for Neovim
-- NOTE: Essential foundation for plugin management. Handles installation, updates, and lazy loading.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugin.colors" },
    { import = "plugin.completion" },
    { import = "plugin.dap" },
    { import = "plugin.editor" },
    { import = "plugin.lsp" },
    { import = "plugin.syntax" },
    { import = "plugin.testing" },
    { import = "plugin.ui" },
    { import = "plugin.util" },
  },
  checker = { enabled = true },
  dev = { path = "~/Development/Projects" },
  install = { colorscheme = { "gruvbox-material" } },
  ui = { border = "rounded" },
})
