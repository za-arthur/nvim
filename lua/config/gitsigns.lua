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
  keys = {
    utils.lazymap("<leader>gs", "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk"),
    utils.lazymap("<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk"),
    utils.lazymap("<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo stage hunk"),
    utils.lazymap("<leader>gS", "<cmd>Gitsigns stage_buffer<cr>", "Stage buffer"),
    utils.lazymap("<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", "Reset buffer"),
    utils.lazymap("<leader>gp", "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk"),
    utils.lazymap("<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle current line blame"),
    utils.lazymap("<leader>gd", "<cmd>Gitsigns diffthis<cr>", "Show diff"),
    utils.lazymap("<leader>td", "<cmd>Gitsigns toggle_deleted<cr>", "Toggle deleted lines"),
  },
}

return M
