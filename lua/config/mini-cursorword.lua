local M = {
  "echasnovski/mini.cursorword",
  event = "VeryLazy",
  config = function(_, opts)
    require('mini.cursorword').setup(opts)
  end,
}

return M
