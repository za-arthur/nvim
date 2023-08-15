local M = {}

function M.setup()
  vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>')
  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
  vim.keymap.set('n', 'gd', ':FzfLua lsp_definitions<CR>')
  vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
  vim.keymap.set('n', 'gi', ':FzfLua lsp_implementations<CR>')
  vim.keymap.set('n', 'gr', ':FzfLua lsp_references<CR>')
  vim.keymap.set('n', '<Leader>lr', ':LspRestart<CR>', { silent = true })
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
  vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')

  vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format({ timeout_ms = 5000 }) end, {})
end

return M
