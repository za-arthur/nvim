local M = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  build = ":TSUpdate",
  opts = {
    highlight = {
      enable = true,
      disable = require("utils").is_large,
    },
    ensure_installed = {
      "c",
      "cpp",
      "bash",
      "diff",
      "dockerfile",
      "go",
      "gomod",
      "python",
      "json",
      "lua",
      "make",
      "yaml",
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
          ['ia'] = '@parameter.inner',
          ['aa'] = '@parameter.outer',
        }
      },
    },
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
}

return M
