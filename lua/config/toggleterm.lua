local M = {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  opts = {
    open_mapping = [[<c-\>]],
    insert_mappings = true,
    shell = "/opt/homebrew/bin/fish",
    start_in_insert = true,
    direction = "float",
  },
  config = function(_, opts)
    local utils = require("utils")
    require("toggleterm").setup(opts)

    utils.keymap("<leader>gt", function()
        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({
          cmd = "lazygit",
          direction = "tab",
          hidden = true,
        })
        lazygit:toggle()
      end,
      "Show lazygit")
  end
}

return M
