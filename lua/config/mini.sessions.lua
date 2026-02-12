local utils = require("utils")

local M = {
  "echasnovski/mini.sessions",
  lazy = false,
  opts = {
    autoread = true,
    file = "Session.vim",
  },
  keys = {
    utils.lazymap("<leader>S", "<cmd>lua MiniSessions.write('Session.vim')<cr>", "Write session"),
  },
}

return M
