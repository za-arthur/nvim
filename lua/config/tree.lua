local M = {}

function M.setup()
  require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    open_on_setup_file = true,
    view = {
      number = true,
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
