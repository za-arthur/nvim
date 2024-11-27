local utils = require("utils")

local M = {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = {
    "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")

    dapui.setup({
      expand_lines = true,
      icons = { expanded = "", collapsed = "", circular = "" },
      mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.33 },
            { id = "breakpoints", size = 0.17 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.25 },
          },
          size = 0.33,
          position = "right",
        },
        {
          elements = {
            { id = "repl", size = 0.45 },
            { id = "console", size = 0.55 },
          },
          size = 0.27,
          position = "bottom",
        },
      },
      floating = {
        max_height = 0.9,
        max_width = 0.5, -- Floats will be treated as percentage of your screen.
        border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
    }) -- use default

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
  keys = {
    utils.lazymap("<leader>dU", "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI"),
    utils.lazymap("<leader>de", "<cmd>lua require'dapui'.eval()<cr>", "Evaluate"),
    utils.lazymap("<leader>dh", "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover variables"),
    utils.lazymap("<leader>dS", "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes"),
  },
}

return M
