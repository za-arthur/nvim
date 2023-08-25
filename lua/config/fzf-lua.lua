local utils = require("utils")

local M = {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  keys = {
    utils.lazymap("<leader>ff", "<cmd>FzfLua files<cr>", "FzfLua Files"),
    utils.lazymap("<leader>fb", "<cmd>FzfLua buffers<cr>", "FzfLua Buffers"),
    utils.lazymap("<leader>fo", "<cmd>FzfLua oldfiles<cr>", "FzfLua Old files"),
    utils.lazymap("<leader>fg", "<cmd>FzfLua live_grep<cr>", "FzfLua Live grep"),
    utils.lazymap("<leader>fc", "<cmd>FzfLua commands<cr>", "FzfLua Commands"),
    utils.lazymap("gD", "<cmd>FzfLua lsp_declarations<CR>", "FzfLua Declarations"),
    utils.lazymap("gd", "<cmd>FzfLua lsp_definitions<CR>", "FzfLua Definitions"),
    utils.lazymap("gm", "<cmd>FzfLua lsp_implementations<CR>", "FzfLua Implementations"),
    utils.lazymap("gr", "<cmd>FzfLua lsp_references<CR>", "FzfLua References"),
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

return M
