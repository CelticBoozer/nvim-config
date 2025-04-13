-- INFO: Visual indentation guides (v3+)
-- NOTE: Modern indentation visualization with treesitter

return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    indent = {
      char = "▏",
      smart_indent_cap = true,
    },
    scope = {
      highlight = "Orange",
      include = {
        node_type = { ["*"] = { "*" } },
      },
    },
  },
  main = "ibl",
}
