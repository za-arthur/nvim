local utils = require("utils")

local M = {
  "kevinhwang91/nvim-bqf",
  event = "VeryLazy",
  keys = {
    utils.lazymap("]q", "<cmd>cnext<cr>", "Next quickfix"),
    utils.lazymap("[q", "<cmd>cprevious<cr>", "Previous quickfix"),
  },
}

return M
