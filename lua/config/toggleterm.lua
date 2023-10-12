local M = {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  opts = {
    open_mapping = [[<c-\>]],
    insert_mappings = true,
    start_in_insert = true,
    direction = "float",
  },
  config = function(_, opts)
    local utils = require("utils")
    require("toggleterm").setup(opts)

    utils.keymap("<leader>gt", function()
        local Terminal = require("toggleterm.terminal").Terminal
        local gitui = Terminal:new({
          cmd = "gitui",
          direction = "tab",
          hidden = true,
        })
        gitui:toggle()
      end,
      "Show gitui")
  end
}

return M
