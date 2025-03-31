local utils = require("utils")

local M = {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  keys = {
    utils.lazymap("[d", vim.diagnostic.goto_prev, "Previous diagnostic"),
    utils.lazymap("]d", vim.diagnostic.goto_next, "Next diagnostic"),
    utils.lazymap("<leader>K", vim.lsp.buf.hover, "Display hover information"),
    utils.lazymap("<leader>k", vim.lsp.buf.signature_help, "Display signature information"),
  },
  config = function()
    require("config.lsp.mason").setup()
    require("config.lsp.handlers").setup()
  end,
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  -- {
  -- -- Setup package installation https://github.com/williamboman/mason.nvim/issues/130#issuecomment-1217773757
  --   "mfussenegger/nvim-lint",
  --   -- event = "BufReadPre",
  --   config = function()
  --     require('lint').linters_by_ft = {
  --       c = { "clangtidy", },
  --       cpp = { "clangtidy", },
  --       go = { "golangcilint", },
  --       python = { "pylint", },
  --       yaml = { "yamllint", },
  --     }
  --
  --     vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  --       callback = function()
  --         require("lint").try_lint()
  --       end,
  --     })
  --   end,
  -- },
}

return M
