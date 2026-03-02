local M = {
  "tpope/vim-fugitive",
  cmd = {
    "Git",
    "Gdiffsplit",
    "Gclog",
    "Gread",
    "Gwrite",
    "Gedit",
    "Ggrep",
  },
  init = function()
    vim.g.fugitive_summary_format = "%cs || %<(20,trunc)%an %<(25,trunc)%ae || %s"
  end,
  keys = {
    { "<leader>gg", "<cmd>tabnew | Git | only<cr>", desc = "Git fugitive" },
    { "<leader>gl", "<cmd>tabnew | Gclog -1000<cr>", desc = "Git log" },
    { "<leader>gs", "<cmd>tabnew | Gclog -g stash<cr>", desc = "Git show stash" },
  },
  config = function()
    -- Create the augroup inside the config function
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
  end,
}

return M
