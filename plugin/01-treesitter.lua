vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter",
    version = "main",
  }
})

local ts = require("nvim-treesitter")
local parsers = {
  "c",
  "cpp",
  "bash",
  "diff",
  "dockerfile",
  "fish",
  "go",
  "gomod",
  "python",
  "json",
  "lua",
  "nix",
  "make",
  "markdown",
  "markdown_inline",
  "html",
  "rust",
  "sql",
  "yaml",
}

ts.setup({
  install_dir = vim.fn.stdpath('data') .. '/site'
})
ts.install(parsers)

-- Not every tree-sitter parser is the same as the file type detected
-- So the patterns need to be registered more cleverly
local patterns = {}
for _, parser in ipairs(parsers) do
  local parser_patterns = vim.treesitter.language.get_filetypes(parser)
  for _, pp in pairs(parser_patterns) do
    table.insert(patterns, pp)
  end
end

vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'

vim.api.nvim_create_autocmd('FileType', {
  pattern = patterns,
  callback = function()
    vim.treesitter.start()
  end,
})
