-- INFO: updates nvim-web-devicons colors based on colorscheme.
return {
  "rachartier/tiny-devicons-auto-colors.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("tiny-devicons-auto-colors").setup({
      colors = {
        "#ea6962",
        "#e78a4e",
        "#d8a657",
        "#a9b665",
        "#89b482",
        "#7daea3",
        "#d3869b",
        "#ea6962",
        "#a9b665",
        "#d8a657",
      },
    })
  end,
}
