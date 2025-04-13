-- INFO: Enhances Markdown file readability by rendering elements like headings, lists, and tables within Neovim.
-- NOTE: Provides an in-editor Markdown preview without external dependencies.

return {
  "MeanderingProgrammer/render-markdown.nvim",
  lazy = false,
  ft = { "markdown", "quarto" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    enabled = true,
    render_modes = { "n", "c", "t" },
    file_types = { "markdown", "quarto" },
    heading = {
      position = "inline",
      backgrounds = { "RenderMarkdownHdNoBg" },
    },
    sign = {
      enabled = false,
    },
  },
}
