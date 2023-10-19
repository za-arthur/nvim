local utils = require("utils")

local M = {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  keys = {
    utils.lazymap("<leader>ff", "<cmd>FzfLua files<cr>", "FzfLua Files"),
    utils.lazymap("<leader>fF", "<cmd>FzfLua files fd_opts=--no-ignore<cr>", "FzfLua Files (--no-ignore)"),
    utils.lazymap("<leader>fb", "<cmd>FzfLua buffers<cr>", "FzfLua Buffers"),
    utils.lazymap("<leader>fg", "<cmd>FzfLua live_grep_glob<cr>", "FzfLua Live grep glob"),
    utils.lazymap("<leader>fw", "<cmd>FzfLua grep_cword<cr>", "FzfLua Word"),
    utils.lazymap("<leader>fc", "<cmd>FzfLua commands<cr>", "FzfLua Commands"),
    utils.lazymap("<leader>fr", "<cmd>FzfLua resume<cr>", "FzfLua Resume"),
    utils.lazymap("gD", "<cmd>FzfLua lsp_declarations<CR>", "FzfLua Declarations"),
    utils.lazymap("gd", "<cmd>FzfLua lsp_definitions<CR>", "FzfLua Definitions"),
    utils.lazymap("gm", "<cmd>FzfLua lsp_implementations<CR>", "FzfLua Implementations"),
    utils.lazymap("gr", "<cmd>FzfLua lsp_references<CR>", "FzfLua References"),
    utils.lazymap("gs", "<cmd>FzfLua lsp_document_symbols<CR>", "FzfLua Document Symbols"),
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

return M
