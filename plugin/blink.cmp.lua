vim.pack.add({
  "https://github.com/rafamadriz/friendly-snippets",
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("1.*"),
  },
})

require("blink.cmp").setup({
  fuzzy = {
    prebuilt_binaries = {
      force_version = "v*",
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    per_filetype = {
      sql = { "snippets", "dadbod", "buffer" },
    },
    providers = {
      dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
    },
  },
  cmdline = {
    keymap = {
      ["<Tab>"] = { "show", "accept" },
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
})
