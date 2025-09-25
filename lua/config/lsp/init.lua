local utils = require("utils")

local M = {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  keys = {
    utils.lazymap("[d", vim.diagnostic.goto_prev, "Previous diagnostic"),
    utils.lazymap("]d", vim.diagnostic.goto_next, "Next diagnostic"),
    utils.lazymap("<leader>K", vim.lsp.buf.hover, "Display hover information"),
    utils.lazymap("<leader>k", vim.lsp.buf.signature_help, "Display signature information"),
  },
  opts = {
    ensure_installed = {
      "gopls",
      "marksman",
      "pyright",
      "rust_analyzer",
    },
    automatic_installation = true,
  },
  config = function()
    require("config.lsp.handlers").setup()

    -- Custom config for clangd
    vim.lsp.config("clangd", {
      settings = {
        cmd = { "clangd", "--log=error", "--clang-tidy" },
      },
    })
    vim.lsp.enable("clangd")

    -- Configure all LSPs
    require("mason").setup()
    require("mason-lspconfig").setup()

    -- Formatters
    local formatters = {
      "gofumpt",
      "goimports",
      "golines",
      "yamlfmt",
      "black",
    }
    vim.api.nvim_create_user_command("MasonInstallAll", function()
      vim.cmd("MasonInstall " .. table.concat(formatters, " "))
    end, {})
  end,
  dependencies = {
    "mason-org/mason.nvim",
    -- "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
}

return M
