local M = {
  "folke/sidekick.nvim",
  enabled = false,
  opts = {
    nes = {
      enabled = false,
    },
    cli = {
      enabled = true,
      tools = {
        amp = {
          cmd = { "amp", "threads", "continue" },
        },
        copilot = {
          cmd = { "copilot", "--continue" },
        },
      },
    },
  },
  keys = {
    {
      "<c-.>",
      function() require("sidekick.cli").toggle() end,
      desc = "Sidekick Toggle",
      mode = { "n", "t", "i", "x" },
    },
    {
      "<leader>ac",
      function() require("sidekick.cli").toggle({ name = "copilot", focus = true }) end,
      desc = "Sidekick Toggle Copilot",
    },
    {
      "<leader>as",
      function() require("sidekick.cli").select() end,
      desc = "Select CLI",
    },
    {
      "<leader>ad",
      function() require("sidekick.cli").close() end,
      desc = "Detach a CLI Session",
    },
    {
      "<leader>at",
      function() require("sidekick.cli").send({ msg = "{this}" }) end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      "<leader>af",
      function() require("sidekick.cli").send({ msg = "{file}" }) end,
      desc = "Send File",
    },
    {
      "<leader>av",
      function() require("sidekick.cli").send({ msg = "{selection}" }) end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
    {
      "<leader>ap",
      function() require("sidekick.cli").prompt() end,
      mode = { "n", "x" },
      desc = "Sidekick Select Prompt",
    },
  },
}

return M
