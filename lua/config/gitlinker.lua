local utils = require("utils")

local M = {
  'linrongbin16/gitlinker.nvim',
  event = "BufReadPre",
  keys = {
    utils.lazymap("<leader>gl", "<cmd>GitLink!browse<cr>", "GitLink Browse"),
  },
  config = function(_, opts)
    require("gitlinker").setup(opts)
  end,
}

return M
