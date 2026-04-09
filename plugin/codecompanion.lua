vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  {
    src = "https://github.com/olimorris/codecompanion.nvim",
    version = vim.version.range("^19.0.0"),
  },
})

require("codecompanion").setup({
  interactions = {
    chat = {
      adapter = {
        name = "copilot",
        model = "gpt-5.3-codex",
      },
    },
    inline = {
      adapter = {
        name = "copilot",
        model = "gpt-5-mini",
      },
    },
    cmd = {
      adapter = "copilot",
    },
    background = {
      adapter = "copilot",
    },
  },
  display = {
    chat = {
      window = {
        width = 0.3,
      },
    },
  },
})

local utils = require("utils")

utils.keymap("<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", "CodeCompanion toggle", { "n", "v" })
utils.keymap("<leader>aa", "<cmd>CodeCompanionActions<cr>", "CodeCompanion actions", { "n", "v" })
utils.keymap("<leader>ai", "<cmd>CodeCompanion<cr>", "CodeCompanion inline", { "n", "v" })
