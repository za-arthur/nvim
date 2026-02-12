local M = {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
  opts = {
    interactions = {
      chat = {
        adapter = {
          name = "copilot",
          model = "gpt-5.2-codex",
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
  },
  keys = {
    { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "CodeCompanion Chat", mode = { "n", "v" } },
    { "<leader>aa", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions", mode = { "n", "v" } },
    { "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "CodeCompanion Inline", mode = { "n", "v" } },
  },
}

return M
