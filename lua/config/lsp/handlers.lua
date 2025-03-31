local M = {}

M.capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

function M.on_attach(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
end

function M.setup()
  -- Diagnostic configuration
  vim.diagnostic.config({
    virtual_text = false,
    float = {
      focusable = false,
      style = "minimal",
      source = true,
      header = "",
      prefix = "",
    },
    -- show signs
    signs = {
      -- active = signs,
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN]  = "",
        [vim.diagnostic.severity.HINT]  = "",
        [vim.diagnostic.severity.INFO]  = "",
      }
    },
    update_in_insert = false,
    severity = { min = vim.diagnostic.severity.WARN },
    severity_sort = false,
  })

  -- show diagnostics in hover window
  vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter" },
        border = "rounded",
        source = "always",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })
end

return M
