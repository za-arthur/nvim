vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require("gitsigns").setup({
  current_line_blame = true,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns
    local utils = require("utils")

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
})
