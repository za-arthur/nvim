local M = {
  "nvim-treesitter/nvim-treesitter",
  version = "*",
  event = "BufReadPost",
  build = ":TSUpdate",
  opts = {
    highlight = {
      enable = true,
      disable = require("utils").is_large,
    },
    indent = {
      enable = true,
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
      "markdown",
      "markdown_inline",
      "rust",
      "sql",
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
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    vim.filetype.add({
      extension = {
        mdx = "markdown",
      }
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
}

return M
