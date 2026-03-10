local M = {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    {
      "tpope/vim-dadbod",
      lazy = true,
    },
    {
      "kristijanhusak/vim-dadbod-completion",
      ft = { "sql", "plpsql", },
      lazy = true,
    },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
  end,
  keys = {
    { "<leader>cd", "<cmd>DBUIToggle<cr>", desc = "Dadbod UI toggle", mode = { "n", "v" } },
    { "<leader>ca", "<cmd>DBUIAddConnection<cr>", desc = "Dadbod UI add connection", mode = { "n", "v" } },
  },
}

return M
