local utils = require("utils")

local M = {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  opts = {
    disable_netrw = true,
    hijack_netrw = true,
    view = {
      preserve_window_proportions = true,
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
    },
    modified = {
      enable = true,
    },
    renderer = {
      special_files = {
        "go.mod",
        "go.sum",
        "Makefile",
        "README.md",
        "readme.md",
      },
    },
    filters = {
      custom = {
        "^\\.git$",
        ".cache",
        "node_modules",
        "__pycache__",
      },
    },
  },
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  keys = {
    utils.lazymap("<leader>ee", "<cmd>NvimTreeToggle<cr>", "NvimTree Toggle"),
    utils.lazymap("<leader>ef", "<cmd>NvimTreeFindFile<cr>", "NvimTree Current file"),
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  }
}

return M
