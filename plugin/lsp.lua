vim.pack.add({
  "https://github.com/saghen/blink.cmp",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
})

-- 1. Capabilities Setup
local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

-- 2. Diagnostic Configuration
vim.diagnostic.config({
  virtual_text = false,
  float = {
    focusable = false,
    style = "minimal",
    source = true,
    header = "",
    prefix = "",
  },
  signs = {
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

-- 3. LspAttach Autocommand (Keymaps & Buffer Settings)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = ev.buf })

    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev,
      { buffer = ev.buf, silent = true, noremap = true, desc = "Previous diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next,
      { buffer = ev.buf, silent = true, noremap = true, desc = "Next diagnostic" })
    vim.keymap.set("n", "<leader>K", function() vim.lsp.buf.hover({ border = "rounded" }) end,
      { buffer = ev.buf, silent = true, noremap = true, desc = "Display hover information" })
    vim.keymap.set("n", "<leader>k", function() vim.lsp.buf.signature_help({ border = "rounded" }) end,
      { buffer = ev.buf, silent = true, noremap = true, desc = "Display signature information" })
  end,
})

-- 4. Mason Setup
require("mason").setup()

-- 5. LSP Servers Configuration
vim.lsp.config("marksman", {
  capabilities = capabilities,
})
vim.lsp.enable("marksman")

vim.lsp.config("pyright", {
  capabilities = capabilities,
})
vim.lsp.enable("pyright")

vim.lsp.config("clangd", {
  capabilities = capabilities,
  settings = {
    cmd = { "clangd", "--log=error", "--clang-tidy", "--header-insertion=never" },
  },
})
vim.lsp.enable("clangd")

-- 6. Unified Installation Command
local mason_tools = {
  -- LSPs
  "marksman",
  "pyright",
  -- Formatters
  "yamlfmt",
  "black",
  "tree-sitter-cli",
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd("MasonInstall " .. table.concat(mason_tools, " "))
end, { desc = "Install all required Mason tools" })
