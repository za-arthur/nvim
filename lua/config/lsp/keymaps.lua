local M = {}

function M.setup()
  local bufopts = { noremap = true, silent = true }

  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)

  vim.keymap.set('n', 'gD', ':FzfLua lsp_declarations<CR>', bufopts)
  vim.keymap.set('n', 'gd', ':FzfLua lsp_definitions<CR>', bufopts)
  vim.keymap.set('n', 'gi', ':FzfLua lsp_implementations<CR>', bufopts)
  vim.keymap.set('n', 'gr', ':FzfLua lsp_references<CR>', bufopts)

  vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, bufopts)

  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

  vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format({ timeout_ms = 5000 }) end, {})

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
