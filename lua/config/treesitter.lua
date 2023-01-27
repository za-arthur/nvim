local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup {
    highlight = {
      enable = true,
    },
    ensure_installed = {
      "c",
      "go",
      "gomod",
      "python",
      "json",
      "lua",
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
        }
      },
    },
  }
end

return M
