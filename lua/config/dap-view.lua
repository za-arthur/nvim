local utils = require("utils")

local M = {
  "igorlfs/nvim-dap-view",
  opts = {
    winbar = {
        controls = {
            enabled = true,
            buttons = { "play", "step_into", "step_over", "step_out" },
        },
    },
  },
  keys = {
    utils.lazymap("<leader>dv", "<cmd>DapViewToggle<cr>", "DAP View toggle"),
    utils.lazymap("<leader>dw", "<cmd>DapViewWatch<cr>", "DAP View watch"),
  }
}

return M
