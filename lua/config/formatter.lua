local utils = require("utils")

local M = {
  "mhartington/formatter.nvim",
  event = "BufReadPre",
  keys = {
    utils.lazymap("<leader>bf", "<cmd>Format<cr>", "Format buffer"),
    utils.lazymap("<leader>bF", "<cmd>FormatWrite<cr>", "Format buffer and write"),
  },
  config = function()
    require("formatter").setup({
      filetype = {
        go = {
          require("formatter.filetypes.go").gofumpt,
          require("formatter.filetypes.go").goimports,
          require("formatter.filetypes.go").golines,
        },
        rust = {
          require("formatter.filetypes.rust").rustfmt,
        },
        sql = {
          require("formatter.filetypes.sql").pgformat,
        },
        python = {
          require("formatter.filetypes.python").black,
        },
        ["*"] = {
          function()
            -- Ignore already configured types.
            local defined_types = require("formatter.config").values.filetype
            if defined_types[vim.bo.filetype] ~= nil then
              return nil
            end
            vim.lsp.buf.format({ async = true })
          end,
        },
      },
    })
  end,
}

return M
