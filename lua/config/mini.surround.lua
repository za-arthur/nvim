local M = {
  "echasnovski/mini.surround",
  event = "VeryLazy",
  config = function(_, opts)
    require('mini.surround').setup(opts)
  end,
}

return M
