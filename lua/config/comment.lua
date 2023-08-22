local M = {
  'numToStr/Comment.nvim',
  lazy = false,
  config = function(_, _)
    require("Comment").setup()
  end
}

return M
