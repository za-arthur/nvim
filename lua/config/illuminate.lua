local M = {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  opts = {
    large_file_cutoff = 10000,
  },
  config = function(_, opts)
    require('illuminate').configure(opts)
  end,
}

return M
