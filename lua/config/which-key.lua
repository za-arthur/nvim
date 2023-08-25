local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    window = {
      border = "single",   -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  },
  config = function()
    local whichkey = require("which-key")

    local opts = {
      mode = "n",     -- Normal mode
      prefix = "<leader>",
      buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true,  -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = false, -- use `nowait` when creating keymaps
    }

    local mappings = {
      e = {
        name = "Tree",
      },
      b = {
        name = "Buffer",
        c = { "<Cmd>bd!<Cr>", "Close current buffer" },
      },
      f = {
        name = "Find",
      },
      z = {
        name = "Packer",
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
      },
      g = {
        name = "Git",
      },
      t = {
        name = "Toggle",
      },
    }

    whichkey.register(mappings, opts)
  end,
}

return M
