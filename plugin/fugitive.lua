vim.pack.add({ "https://github.com/tpope/vim-fugitive" })

vim.g.fugitive_summary_format = "%cs || %<(20,trunc)%an %<(25,trunc)%ae || %s"

local group = vim.api.nvim_create_augroup("CustomFugitiveMappings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "fugitive",
  callback = function()
    -- Buffer-local mapping for the custom stash list
    vim.keymap.set("n", "czl", ":G --paginate stash list '--pretty=format:%h %as %<(10)%gd %<(76,trunc)%s'<cr>", {
      buffer = true,
      remap = false,
      desc = "Fugitive: Show stash list",
    })
  end,
})

local utils = require("utils")

utils.keymap("<leader>gg", "<cmd>tabnew | Git | only<cr>", "Git fugitive")
utils.keymap("<leader>gl", "<cmd>tabnew | Gclog -1000<cr>", "Git log")
utils.keymap("<leader>gs", "<cmd>tabnew | Gclog -g stash<cr>", "Git show stash")
