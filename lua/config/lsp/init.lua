local M = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  config = function()
    require("config.lsp.mason").setup()
    require("config.lsp.keymaps").setup()
    require("config.lsp.handlers").setup()
    -- require("config.lsp.lint").setup()
    -- require("config.lsp.formatter").setup()
  end,
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }
}

return M
