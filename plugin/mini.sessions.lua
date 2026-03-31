vim.pack.add({ "https://github.com/echasnovski/mini.sessions" })

require("mini.sessions").setup({
  autoread = true,
  directory = "",
  file = "session.vim",
})

local utils = require("utils")

utils.keymap("<leader>S", "<cmd>lua MiniSessions.write('Session.vim')<cr>", "Write session")
