local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    local whichkey = require("which-key")

    whichkey.add({
      { "<leader>e", group = "Tree",        nowait = false, remap = false },
      { "<leader>b", group = "Buffer",      nowait = false, remap = false },
      { "<leader>s", group = "Session",     nowait = false, remap = false },
      { "<leader>f", group = "Find",        nowait = false, remap = false },
      { "<leader>g", group = "Git",         nowait = false, remap = false },
      { "<leader>c", group = "Code action", nowait = false, remap = false },
      { "<leader>r", group = "Rename",      nowait = false, remap = false },
      { "<leader>t", group = "Toggle",      nowait = false, remap = false },
    })
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}

return M
