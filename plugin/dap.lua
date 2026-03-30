vim.pack.add({
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/igorlfs/nvim-dap-view",
})

-- DAP

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

local utils = require("utils")

utils.keymap("<leader>dc", "<cmd>lua require'dap'.continue()<cr>", "Continue")
utils.keymap("<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect")
utils.keymap("<leader>dR", "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to cursor")
utils.keymap("<leader>ds", "<cmd>lua require'dap'.step_into()<cr>", "Step into")
utils.keymap("<leader>dn", "<cmd>lua require'dap'.step_over()<cr>", "Step over")
utils.keymap("<leader>df", "<cmd>lua require'dap'.step_out()<cr>", "Step out")
utils.keymap("<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle repl")
utils.keymap("<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle breakpoint")

-- DAP View

require("dap-view").setup({
  winbar = {
    controls = {
      enabled = true,
      buttons = { "play", "step_into", "step_over", "step_out" },
    },
  },
})

utils.keymap("<leader>dv", "<cmd>DapViewToggle<cr>", "DAP View toggle")
utils.keymap("<leader>dw", "<cmd>DapViewWatch<cr>", "DAP View watch")
