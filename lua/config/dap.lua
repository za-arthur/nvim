local utils = require("utils")

local M = {
  'mfussenegger/nvim-dap',
  event = "VeryLazy",
  config = function(_, _)
    local dap = require('dap')
    dap.adapters.lldb = {
      type = 'executable',
      command = '/opt/homebrew/opt/llvm/bin/lldb-dap',
      name = 'lldb'
    }
    dap.configurations.cpp = {
      {
        name = "Attach to PostgreSQL process",
        type = 'lldb',
        request = 'attach',
        pid = function()
          local dap_util = require('dap.utils')
          return dap_util.pick_process({ filter = "postgres" })
        end,
        args = {},
      },
    }
    dap.configurations.c = dap.configurations.cpp
  end,
  keys = {
    utils.lazymap("<leader>dc", "<cmd>lua require'dap'.continue()<cr>", "Continue"),
    utils.lazymap("<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect"),
    utils.lazymap("<leader>dR", "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to cursor"),
    utils.lazymap("<leader>ds", "<cmd>lua require'dap'.step_into()<cr>", "Step into"),
    utils.lazymap("<leader>dn", "<cmd>lua require'dap'.step_over()<cr>", "Step over"),
    utils.lazymap("<leader>df", "<cmd>lua require'dap'.step_out()<cr>", "Step out"),
    utils.lazymap("<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle repl"),
    utils.lazymap("<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint"),
  },
}

return M
