local M = {}

function M.setup()
  require("indent_blankline").setup {
    char = '▏',
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    space_char_blankline = " ",
  }
end

return M
