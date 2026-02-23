local utils = require("utils")

local M = {
  "igorlfs/nvim-dap-view",
  opts = {},
  cmd = {
    "DapViewOpen",
    "DapViewToggle",
    "DapViewWatch",
  },
  keys = {
    utils.lazymap("<leader>dv", "<cmd>DapViewToggle<cr>", "DAP View toggle"),
    utils.lazymap("<leader>dw", "<cmd>DapViewWatch<cr>", "DAP View watch"),
  }
}

return M
