vim.pack.add({ "https://github.com/mhartington/formatter.nvim" })

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

local utils = require("utils")

utils.keymap("<leader>bf", "<cmd>Format<cr>", "Format buffer")
utils.keymap("<leader>bF", "<cmd>FormatWrite<cr>", "Format buffer and write")
