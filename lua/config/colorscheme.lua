local M = {
  "tomasiser/vim-code-dark",
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd("colorscheme codedark")
  end,
}

return M
