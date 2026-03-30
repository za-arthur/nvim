vim.pack.add({ "https://github.com/echasnovski/mini.indentscope" })

require("mini.indentscope").setup({
  draw = {
    animation = function()
      return 0
    end,
  },
})
