-- INFO: Search Plugin to enable a tabbed search interface using Telescope.
-- NOTE: This plugin allows switching between different search modes.

return {
  "FabianWirth/search.nvim",
  lazy = false,
  event = "VeryLazy",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>ff",
      "<cmd>lua require('search').open()<CR>",
      desc = "Open Search Tabs",
    },
  },
  opts = {
    mappings = {
      next = "<Tab>",
      prev = "<S-Tab>",
    },
    tabs = {
      {
        name = "Files",
        tele_func = require("telescope.builtin").find_files,
      },
      {
        name = "Grep",
        tele_func = require("telescope.builtin").live_grep,
      },
      {
        name = "Git files",
        tele_func = require("telescope.builtin").git_files,
      },
      {
        name = "Buffers",
        tele_func = require("telescope.builtin").buffers,
      },
      {
        name = "Media",
        tele_func = function()
          require("telescope").extensions.media_files.media_files()
        end,
      },
      {
        name = "Docker",
        tele_func = function()
          require("telescope").extensions.docker.docker()
        end,
      },
      {
        name = "Undo history",
        tele_func = function()
          require("telescope").extensions.undo.undo()
        end,
      },
    },
  },
}
