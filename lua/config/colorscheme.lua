local M = {
  "Mofiqul/vscode.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme vscode")
    -- Adjust inactive C/C++ preprocessor blocks to be more readable
    vim.api.nvim_set_hl(0, "@lsp.type.comment.c", { fg = "#A0A0A0" })
    vim.api.nvim_set_hl(0, "@lsp.type.comment.cpp", { fg = "#A0A0A0" })
  end,
}

return M
