local utils = require("utils")

local M = {
  "kevinhwang91/nvim-bqf",
  event = "VeryLazy",
  opts = {
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
  },
  keys = {
    utils.lazymap("]q", "<cmd>cnext<cr>", "Next quickfix"),
    utils.lazymap("[q", "<cmd>cprevious<cr>", "Previous quickfix"),
  },
}

return M
