local M = {
  "tpope/vim-fugitive",
  cmd = {
    "Git",
    "Gdiffsplit",
    "Gclog",
    "Gread",
    "Gwrite",
    "Gedit",
    "Ggrep",
  },
  init = function()
    vim.g.fugitive_summary_format = "%cs || %<(20,trunc)%an %<(25,trunc)%ae || %s"
  end,
  keys = {
    { "<leader>gg", "<cmd>tabnew | Git | only<cr>", desc = "Git fugitive" },
    { "<leader>gl", "<cmd>tabnew | Gclog -1000<cr>", desc = "Git log" },
  },
}

return M
