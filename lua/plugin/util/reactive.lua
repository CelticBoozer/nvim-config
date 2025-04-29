-- INFO: Reactive UI highlighting
-- NOTE: Dynamic highlights based on context and mode

return {
  "rasulomaroff/reactive.nvim",
  opts = function()
    local mypreset = {
      name = "mypreset",
      init = function()
        vim.opt.cursorline = true
        vim.opt.termguicolors = true
      end,
      static = {
        winhl = {
          inactive = {
            CursorLine = { bg = "#46413e" },
            CursorLineNr = { fg = "#d4be98", bg = "#46413e" },
          },
        },
      },
      modes = {
        no = {
          operators = {
            [{ "gu", "gU", "g~", "~" }] = {
              winhl = {
                CursorLine = { bg = "#334155" },
                CursorLineNr = { fg = "#cbd5e1", bg = "#334155" },
              },
            },
            c = {
              winhl = {
                CursorLine = { bg = "#424a3e" },
                CursorLineNr = { fg = "#d4be98", bg = "#424a3e" },
              },
            },
            d = {
              winhl = {
                CursorLine = { bg = "#472322" },
                CursorLineNr = { fg = "#d4be98", bg = "#472322" },
              },
            },
            y = {
              winhl = {
                CursorLine = { bg = "#574833" },
                CursorLineNr = { fg = "#d4be98", bg = "#574833" },
              },
            },
          },
        },

        i = {
          winhl = {
            CursorLine = { bg = "#5b534d" },
            CursorLineNr = { fg = "#d4be98", bg = "#5b534d" },
          },
        },
        n = {
          winhl = {
            CursorLine = { bg = "#404946" },
            CursorLineNr = { fg = "#d4be98", bg = "#404946" },
          },
        },
        [{ "v", "V", "\x16" }] = {
          winhl = {
            CursorLineNr = { fg = "#d4be98" },
            Visual = { bg = "#0f3a42" },
          },
        },
        [{ "s", "S", "\x13" }] = {
          winhl = {
            CursorLineNr = { fg = "#d4be98" },
            Visual = { bg = "#0f3a42" },
          },
        },
        R = {
          winhl = {
            CursorLine = { bg = "#543937" },
            CursorLineNr = { fg = "#d4be98", bg = "#543937" },
          },
        },
      },
    }
    require("reactive").add_preset(mypreset)
    return {
      builtin = {
        cursorline = false,
        cursor = false,
        modemsg = false,
      },
    }
  end,
}
