-- INFO: File tree explorer with enhanced features
-- NOTE: Provides traditional sidebar-style file navigation

return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- pretty icons
  },
  keys = {
    { "<leader>te", ":NvimTreeToggle<CR>", desc = "Toggle file explorer (left sidebar)" },
  },
  opts = {
    hijack_cursor = true,
    reload_on_bufenter = true,
    renderer = {
      hidden_display = "all",
      highlight_git = "name",
      highlight_opened_files = "icon",
      highlight_hidden = "name",
      icons = {
        git_placement = "after",
        diagnostics_placement = "right_align",
        glyphs = {
          git = {
            deleted = " ",
            renamed = " ",
            untracked = " ",
            ignored = " ",
            unstaged = " ",
            staged = " ",
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = " ",
        info = " ",
        warning = " ",
        error = " ",
      },
    },
    filters = {
      dotfiles = true,
    },
    tab = {
      sync = {
        open = true,
        close = true,
      },
    },
  },
  config = function(_, opts)
    -- Set our own on_attach callback to override the default keymaps.
    opts.on_attach = function(bufnr)
      local api = require("nvim-tree.api")

      local function nnoremap(keys, func, desc)
        vim.keymap.set(
          "n",
          keys,
          func,
          { buffer = bufnr, noremap = true, silent = true, nowait = true, desc = "nvim-tree: " .. desc }
        )
      end

      api.config.mappings.default_on_attach(bufnr)

      -- Define new custom key mappings:
      nnoremap(".", api.tree.change_root_to_node, "CD")
      nnoremap("t", api.node.open.tab, "Open: New Tab")
      nnoremap("s", api.node.open.vertical, "Open: Vertical Split")
      nnoremap("S", api.node.open.horizontal, "Open: Horizontal Split")
    end

    require("nvim-tree").setup(opts)
  end,
}
