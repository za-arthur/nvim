local api = vim.api
local g = vim.g
local utils = require("utils")

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

-- Quickly clear search highlighting.
vim.keymap.set('n', '<esc>', '<cmd>noh<cr>')

-- Reselect visual selection after indenting.
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Resize with arrows.
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>')
vim.keymap.set('n', '<C-Down>', ':resize -2<CR>')
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>')
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>')

utils.keymap("<leader>w", "<cmd>update!<cr>", "Save")
utils.keymap("<leader>q", "<cmd>q<cr>", "Quit")

-- toggle options
vim.keymap.set("n", "<leader>tw", function()
  utils.toggle("wrap")
end, { desc = "Toggle Word Wrap" })

vim.keymap.set("n", "<leader>ts", function()
  utils.toggle("spell")
end, { desc = "Toggle Spelling" })

vim.keymap.set("n", "<leader>td", utils.toggle_diagnostics, { desc = "Toggle Diagnostics" })
