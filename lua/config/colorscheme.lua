local M = {
  "tomasiser/vim-code-dark",
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    vim.cmd("colorscheme codedark")
    -- Fix snacks.nvim picker backgrounds
    vim.api.nvim_set_hl(0, "SnacksPicker", { link = "Normal" })
    -- -- Fix diff colors
    vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#2e4b2e', fg = 'NONE' })      -- Dark green background
    vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#45565c', fg = 'NONE' })   -- Dark yellow background
    vim.api.nvim_set_hl(0, 'DiffDelete', { bg = '#4c1e15', fg = 'NONE' }) -- Dark red background
    vim.api.nvim_set_hl(0, 'DiffText', { bg = '#996d74', fg = 'NONE' })     -- Highlighted changed text
  end,
}

return M
