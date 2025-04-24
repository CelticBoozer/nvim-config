-- INFO: Configures nvim-dap
-- NOTE: 'mfussenegger/nvim-dap' provides the core Debug Adapter Protocol client for Neovim

return {
  "mfussenegger/nvim-dap",
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
  },
  keys = {
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      desc = "Start/Continue Debugging",
    },
    {
      "<F10>",
      function()
        require("dap").step_over()
      end,
      desc = "Step Over",
    },
    {
      "<F11>",
      function()
        require("dap").step_into()
      end,
      desc = "Step Into",
    },
    {
      "<F12>",
      function()
        require("dap").step_out()
      end,
      desc = "Step Out",
    },
    {
      "<Leader>dB",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<Leader>db",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Set Conditional Breakpoint",
    },
    {
      "<Leader>dp",
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end,
      desc = "Set Log Point",
    },
    {
      "<Leader>dr",
      function()
        require("dap").repl.open()
      end,
      desc = "Open REPL",
    },
    {
      "<Leader>dl",
      function()
        require("dap").run_last()
      end,
      desc = "Run Last Debugging Session",
    },
  },
  config = function()
    local dap = require("dap")
    local mason_path = vim.fn.stdpath("data") .. "/mason/packages"

    -- Python (debugpy)
    local python_path = mason_path .. "/debugpy/venv/bin/python"
    dap.adapters.python = {
      type = "executable",
      command = python_path,
      args = { "-m", "debugpy.adapter" },
    }
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          return python_path
        end,
      },
    }

    -- Bash (bash-debug-adapter)
    local bash_adapter_path = mason_path .. "/bash-debug-adapter/bash-debug-adapter"
    local bashdb_dir = mason_path .. "/bash-debug-adapter/extension/bashdb_dir"
    dap.adapters.bashdb = {
      type = "executable",
      command = bash_adapter_path,
      name = "bashdb",
    }
    dap.configurations.sh = {
      {
        type = "bashdb",
        request = "launch",
        name = "Launch Bash script",
        showDebugOutput = true,
        pathBashdb = bashdb_dir .. "/bashdb",
        pathBashdbLib = bashdb_dir,
        trace = true,
        file = "${file}",
        program = "${file}",
        cwd = "${workspaceFolder}",
        pathCat = "cat",
        pathBash = "/bin/bash",
        pathMkfifo = "mkfifo",
        pathPkill = "pkill",
        args = {},
        env = {},
        terminalKind = "integrated",
      },
    }

    -- Firefox Debugging
    local firefox_adapter_path = mason_path .. "/firefox-debug-adapter/dist/adapter.bundle.js"
    dap.adapters.firefox = {
      type = "executable",
      command = "node",
      args = { firefox_adapter_path },
    }
    dap.configurations.javascript = {
      {
        name = "Launch Firefox",
        type = "firefox",
        request = "launch",
        reAttach = true,
        url = "http://localhost:3000",
        webRoot = "${workspaceFolder}",
        firefoxExecutable = "/usr/bin/firefox",
      },
    }
    dap.configurations.typescript = dap.configurations.javascript
  end,
}
