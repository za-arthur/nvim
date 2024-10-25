local utils = require("utils")

local M = {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  opts = {
    popup_border_style = "rounded",
    filesystem = {
      filtered_items = {
        hide_by_name = {
          "node_modules",
        },
        never_show = {
          ".git",
          ".DS_Store",
          "__pycache__",
        }
      }
    }
  },
  keys = {
    utils.lazymap("<leader>el", "<cmd>Neotree left filesystem<cr>", "Neotree Show Left"),
    utils.lazymap("<leader>ef", "<cmd>Neotree reveal filesystem<cr>", "Neotree Reveal"),
    utils.lazymap("<leader>ep", "<cmd>Neotree float<cr>", "Neotree Popup"),
    utils.lazymap("<leader>ec", "<cmd>Neotree close<cr>", "Neotree Close"),
    utils.lazymap("<leader>eg", "<cmd>Neotree float git_status<cr>", "Neotree GitStatus"),
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  }
}

return M
