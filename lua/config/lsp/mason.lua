local M = {}

function M.setup()
  -- LSP servers
  local servers = {
    "bashls",
    "gopls",
    "marksman",
    "pylsp",
    "sqlls",
  }

  require('mason').setup()

  -- Configure mason-lspconfig
  require('mason-lspconfig').setup({
    ensure_installed = servers,
    automatic_installation = true,
  })

  -- Configure lspconfig
  local lspconfig = require("lspconfig")

  local opts = {}

  -- loop through the servers
  for _, server in pairs(servers) do
    opts = {
      -- getting "on_attach_format" and capabilities from handlers
      on_attach = require("config.lsp.handlers").on_attach_format,
      capabilities = require("config.lsp.handlers").capabilities,
    }

    -- get the server name
    server = vim.split(server, "@")[1]

    -- pass them to lspconfig
    lspconfig[server].setup(opts)
  end

  -- Separate configs
  lspconfig.clangd.setup({
    on_attach = require("config.lsp.handlers").on_attach,
    capabilities = require("config.lsp.handlers").capabilities,
  })

  lspconfig.lua_ls.setup({
    on_attach = require("config.lsp.handlers").on_attach_format,
    capabilities = require("config.lsp.handlers").capabilities,
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = {
            'vim',
            'require'
          },
          disable = {
            "missing-parameter",
            "redundant-parameter",
            "missing-fields",
          }
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    },
  })
end

return M
