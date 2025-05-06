-- INFO: Advanced code folding with LSP integration
-- NOTE: Provides intuitive folding visualization and navigation

return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = { "BufReadPost", "BufNewFile" },
  keys = {
    {
      "zM",
      function()
        require("ufo").closeAllFolds()
      end,
      { desc = "Close All Folds" },
    },
    {
      "zR",
      function()
        require("ufo").openAllFolds()
      end,
      { desc = "Open All Folds" },
    },
  },
  opts = {
    open_fold_hl_timeout = 150,
    filetype_exclude = { "help", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
    preview = {
      win_config = {
        border = { "", "─", "", "", "", "─", "", "" },
        winhighlight = "Normal:Folded",
        winblend = 0,
      },
      mappings = {
        scrollU = "<C-u>",
        scrollD = "<C-d>",
        jumpTop = "[",
        jumpBot = "]",
      },
    },
    -- luacheck: ignore 212 113
    provider_selector = function(bufnr, filetype, buftype)
      local ft_map = {
        vim = "indent",
        python = { "indent" },
        git = "",
      }
      ---@diagnostic disable-next-line: undefined-global
      if ft_map[filetype] ~= nl then
        return ft_map[filetype]
      end
      return function()
        return require("ufo")
          .getFolds(bufnr, "lsp")
          :catch(function()
            return require("ufo").getFolds(bufnr, "treesitter")
          end)
          :catch(function()
            return require("ufo").getFolds(bufnr, "indent")
          end)
      end
    end,
    fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate)
      local folded_lines = endLnum - lnum
      virtText[#virtText + 1] = { (" ↙ %d lines "):format(folded_lines), "Folded" }
      return virtText
    end,
  },
  config = function(_, opts)
    local caps = vim.lsp.protocol.make_client_capabilities()
    caps.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }
    for _, server in ipairs(vim.tbl_keys(require("lspconfig").servers or {})) do
      require("lspconfig")[server].setup({ capabilities = caps })
    end
    require("ufo").setup(opts)
  end,
}
