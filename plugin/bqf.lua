vim.pack.add({ "https://github.com/kevinhwang91/nvim-bqf" })

require("bqf").setup({
  preview = {
    should_preview_cb = function(bufnr, qwinid)
      local ret = true
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      local fsize = vim.fn.getfsize(bufname)
      if fsize > 100 * 1024 then
        -- skip file size greater than 100k
        ret = false
      elseif bufname:match('^fugitive://') then
        -- skip fugitive buffer
        ret = false
      end
      return ret
    end
  },
})

local utils = require("utils")

utils.keymap("]q", "<cmd>cnext<cr>", "Next quickfix")
utils.keymap("[q", "<cmd>cprevious<cr>", "Previous quickfix")
