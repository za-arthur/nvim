local M = {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    interactions = {
      chat = {
        adapter = {
          name = "copilot",
          model = "gemini-3.1-pro-preview",
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
  },
  keys = {
    { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion toggle", mode = { "n", "v" } },
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion actions", mode = { "n", "v" } },
    { "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "CodeCompanion inline", mode = { "n", "v" } },
  },
}

return M
