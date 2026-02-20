local M = {
  "tpope/vim-fugitive",
  cmd = {
    "Git",
    "Gdiffsplit",
    "Gread",
    "Gwrite",
    "Gedit",
    "Ggrep",
  },
  keys = {
    { "<leader>gg", "<cmd>tabnew | Git | only<cr>", desc = "Git fugitive" },
  },
}

return M
