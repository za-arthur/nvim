local M = {}

function M.setup()
  require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
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
        "\\.git",
        ".cache",
        "node_modules",
        "__pycache__",
      },
    },
  }
end

return M
