vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/tpope/vim-dadbod",
  "https://github.com/kristijanhusak/vim-dadbod-completion",
  "https://github.com/kristijanhusak/vim-dadbod-ui",
})

-- vim-dadbod-completion

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sql", "plpgsql" },
  callback = function()
    vim.cmd("packadd vim-dadbod-completion")
  end,
})

-- vim-dadbod-ui

local utils = require("utils")

utils.keymap("<leader>cd", "<cmd>DBUIToggle<cr>", "Dadbod UI toggle")
utils.keymap("<leader>ca", "<cmd>DBUIAddConnection<cr>", "Dadbod UI add connection")
