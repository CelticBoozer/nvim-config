-- INFO: Advanced code folding with LSP integration
-- NOTE: Provides intuitive folding visualization and navigation

return {
  "kevinhwang91/nvim-ufo",
  event = "LspAttach",
  dependencies = {
    "kevinhwang91/promise-async",
    {
      "luukvbaal/statuscol.nvim",
      config = function()
        require("statuscol").setup({
          foldfunc = "builtin",
          setopt = true,
        })
      end,
    },
  },
  opts = {
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (" 󰁂 %d "):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0

      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, "UfoFoldedEllipsis" })
      return newVirtText
    end,
    provider_selector = function()
      return { "treesitter", "indent" }
    end,
  },
  config = function(_, opts)
    -- Configure LSP folding capabilities
    -- UFO folding
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

    -- Link custom highlight group
    vim.api.nvim_set_hl(0, "UfoFoldedEllipsis", { link = "Comment" })

    -- Initialize UFO with merged options
    require("ufo").setup(opts)

    -- Key mappings for folding
    vim.keymap.set("n", "zE", require("ufo").openAllFolds)
    vim.keymap.set("n", "zC", require("ufo").closeAllFolds)
    vim.keymap.set("n", "ze", require("ufo").openFoldsExceptKinds)
    vim.keymap.set("n", "zc", function()
      require("ufo").closeFoldsWith(1) -- Close only immediate fold
    end, { desc = "Close current fold" })
  end,
}
