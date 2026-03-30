local M = {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    latex = { enabled = false },
  },
  ft = {
    "markdown",
    "codecompanion",
  },
}

return M
