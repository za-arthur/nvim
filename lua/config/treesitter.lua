local M = {}

function M.setup()
  local utils = require("utils")

  require("nvim-treesitter.configs").setup {
    highlight = {
      enable = true,
      disable = utils.is_large,
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
  }
end

return M
