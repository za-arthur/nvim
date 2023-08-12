local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup {
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
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
        }
      },
    },
  }
end

return M
