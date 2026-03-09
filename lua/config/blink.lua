local M = {
  "saghen/blink.cmp",
  event = "BufReadPre",
  version = "1.*",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    fuzzy = {
      prebuilt_binaries = {
        force_version = "v1.9.1",
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    cmdline = {
      keymap = {
        ['<Tab>'] = { 'show', 'accept' },
        ["C-K"] = { "snippet_forward", "fallback" },
        ["C-J"] = { "snippet_backward", "fallback" },
        ["<CR>"] = { "select_and_accept", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
      },
      completion = {
        menu = {
          auto_show = function(ctx)
            return vim.fn.getcmdtype() == ':'
          end,
        },
      },
    },
    keymap = {
      ["C-K"] = { "snippet_forward", "fallback" },
      ["C-J"] = { "snippet_backward", "fallback" },
      ["<CR>"] = { "select_and_accept", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
    },
  },
  opts_extend = { "sources.default" },
}

return M
