local M = {}

function M.setup()
  require("config.lsp.mason").setup()
  require("config.lsp.keymaps").setup()
  require("config.lsp.handlers").setup()
  -- require("config.lsp.lint").setup()
  -- require("config.lsp.formatter").setup()
end

return M
