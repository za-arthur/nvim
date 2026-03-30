vim.pack.add({ "https://github.com/RRethy/vim-illuminate" })

require('illuminate').configure({
  large_file_cutoff = 10000,
})
