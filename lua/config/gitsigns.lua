local utils = require("utils")

local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    current_line_blame = true,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      utils.keymap("]g",
        function()
          if vim.wo.diff then return ']g' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end,
        "Next diff hunk", nil, { buffer = bufnr, }
      )

      utils.keymap("[g",
        function()
          if vim.wo.diff then return '[g' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end,
        "Previous diff hunk", nil, { buffer = bufnr, }
      )
    end
  },
}

return M
