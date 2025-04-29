-- INFO: Editor and UI settings for Neovim
-- NOTE: Configure line numbers, indentation, splits, and more.
local o = vim.opt

-- Set line numbering
o.number = true
o.relativenumber = true

-- Tabs settings
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

-- Save changes automatically
o.autowriteall = true

-- Enable cursor highlighting
o.cursorline = true

-- Search ignoring case
o.ignorecase = true

-- Split rules
o.splitright = true
o.splitbelow = true

-- Some backup and undo rules to keep
o.undofile = true
o.undodir = vim.fn.expand("~/.nvim/undo/")
o.directory = vim.fn.expand("~/.nvim/swp/")
o.backupdir = vim.fn.expand("~/.nvim/backup/")

-- Line wrapping
o.wrap = true
o.linebreak = true

-- Set system clipboard
o.clipboard:append("unnamedplus")

-- Enable mouse input
o.mousemoveevent = true

-- Basic color setup
o.termguicolors = true
o.background = "dark"

vim.diagnostic.config({
  severity_sort = true, -- Sort all diagnostics by severity
})
