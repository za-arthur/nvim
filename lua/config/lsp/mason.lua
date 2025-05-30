local M = {}

function M.setup()
  -- LSP servers
  local servers = {
    -- "clangd",  -- do not install automatically
    "gopls",
    "marksman",
    "pyright",
    "rust_analyzer",
  }

  require("mason").setup()

  -- Configure mason-lspconfig
  require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
  })

  -- Configure lspconfig
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

    lspconfig[server].setup(opts)
  end

  -- Custom setup for clangd
  lspconfig.clangd.setup({
    cmd = { "clangd", "--log=error" },
    on_attach = require("config.lsp.handlers").on_attach,
    capabilities = require("config.lsp.handlers").capabilities,
  })

  -- -- Separate configs
  -- lspconfig.lua_ls.setup({
  --   on_attach = require("config.lsp.handlers").on_attach,
  --   capabilities = require("config.lsp.handlers").capabilities,
  --   settings = {
  --     Lua = {
  --       runtime = {
  --         version = "LuaJIT",
  --       },
  --       diagnostics = {
  --         -- Get the language server to recognize the `vim` global
  --         globals = {
  --           "vim",
  --           "require",
  --         },
  --         disable = {
  --           "missing-parameter",
  --           "redundant-parameter",
  --           "missing-fields",
  --         },
  --       },
  --       workspace = {
  --         -- Make the server aware of Neovim runtime files
  --         library = vim.api.nvim_get_runtime_file("", true),
  --         checkThirdParty = false,
  --       },
  --       -- Do not send telemetry data containing a randomized but unique identifier
  --       telemetry = {
  --         enable = false,
  --       },
  --     },
  --   },
  -- })

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
end

return M
