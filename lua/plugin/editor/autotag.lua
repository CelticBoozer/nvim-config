-- INFO: Automatic HTML tag closure and renaming
-- NOTE: Works with JSX/TSX/XML and other markup languages

return {
  "windwp/nvim-ts-autotag",
  event = "VeryLazy",
  opts = {
    filetypes = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "xml",
      "markdown",
    },
  },
}
