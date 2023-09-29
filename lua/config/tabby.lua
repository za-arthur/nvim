local M = {
  "nanozuki/tabby.nvim",
  lazy = false,
  opts = {
    theme = {
      fill = 'TabLineFill', -- tabline background
      head = 'TabLine', -- head element highlight
      current_tab = 'TabLineSel', -- current tab label highlight
      tab = 'TabLine', -- other tab label highlight
      win = 'TabLine', -- window highlight
      tail = 'TabLine', -- tail element highlight
    },
    nerdfont = true, -- whether use nerdfont
    lualine_theme = nil, -- lualine theme name
    tab_name = {
        name_fallback = 'function({tabid}), return a string',
    },
    buf_name = {
        mode = "'unique'|'relative'|'tail'|'shorten'",
    },
  }
}

return M
