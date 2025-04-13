-- INFO: Debug Adapter Protocol UI with interactive elements
-- NOTE: Provides visual debugging interface with variable inspection and REPL

return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  keys = {
    {
      "<leader>du",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle Debug UI",
    },
    {
      "<leader>de",
      function()
        require("dapui").eval()
      end,
      desc = "Evaluate expression",
      mode = { "n", "v" },
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle breakpoint",
    },
  },
  opts = {
    icons = {
      expanded = "⯆",
      collapsed = "⯈",
      circular = "↺",
    },
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.35 },
          { id = "breakpoints", size = 0.15 },
          { id = "stacks", size = 0.25 },
          { id = "watches", size = 0.25 },
        },
        size = 0.3,
        position = "left",
      },
      {
        elements = {
          "repl",
          "console",
        },
        size = 0.25,
        position = "bottom",
      },
    },
  },
  config = function(_, opts)
    local dapui = require("dapui")
    local dap = require("dap")

    dapui.setup(opts)

    -- Auto open/close UI with debug sessions
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
