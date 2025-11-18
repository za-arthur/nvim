local M = {
  "tomasiser/vim-code-dark",
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd("colorscheme codedark")
    -- Fix snacks.nvim picker backgrounds
    vim.api.nvim_set_hl(0, "SnacksPicker", { link = "Normal" })
  end,
}

return M
