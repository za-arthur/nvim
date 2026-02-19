local M = {
  "tpope/vim-fugitive",
  cmd = {
    "Git",
    "Gdiffsplit",
    "Ggrep",
  },
  keys = {
    { "<leader>gg", "<cmd>tabnew | Git | only<cr>", desc = "Git fugitive" },
  },
}

return M
