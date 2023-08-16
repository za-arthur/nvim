local M = {}

function M.setup()
  local servers = {
    "bashls",
    "clangd",
    "gopls",
    "marksman",
    "pylsp",
    "sqlls",
  }

  require('mason').setup()
  require('mason-lspconfig').setup({
    ensure_installed = servers,
    automatic_installation = true,
  })

  local lspconfig = require("lspconfig")

  local opts = {}

  -- loop through the servers
  for _, server in pairs(servers) do
    opts = {
      -- getting "on_attach" and capabilities from handlers
      on_attach = require("config.lsp.handlers").on_attach,
      capabilities = require("config.lsp.handlers").capabilities,
    }

    -- get the server name
    server = vim.split(server, "@")[1]

    -- pass them to lspconfig
    lspconfig[server].setup(opts)
  end

  -- Separate configs
  lspconfig.lua_ls.setup({
    on_attach = require("config.lsp.handlers").on_attach,
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
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
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
