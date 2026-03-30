vim.pack.add({ "https://github.com/mofiqul/vscode.nvim" })

vim.cmd("colorscheme vscode")
-- Adjust inactive C/C++ preprocessor blocks to be more readable
vim.api.nvim_set_hl(0, "@lsp.type.comment.c", { fg = "#858585" })
vim.api.nvim_set_hl(0, "@lsp.type.comment.cpp", { fg = "#858585" })
