local opt = vim.opt

opt.list = true
opt.listchars:append "space:⋅"

opt.termguicolors = true      -- Enable colors in terminal
opt.hlsearch = true           -- Set highlight on search
opt.number = true             -- Make line numbers default
opt.breakindent = true        -- Enable break indent
opt.undofile = true           -- Save undo history
opt.ignorecase = true         -- Case insensitive searching unless /C or capital in search
opt.tabstop = 4               -- Display tabs as 4 spaces
opt.shiftwidth = 4
opt.smartcase = true          -- Smart case
opt.updatetime = 250          -- Decrease update time
opt.signcolumn = "yes"        -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.timeoutlen = 500
opt.colorcolumn = "80,120"    -- Ruler

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Autoreload on change
vim.api.nvim_create_autocmd(
  { "FocusGained", "TermClose", "TermLeave" },
  { command = "checktime" })
