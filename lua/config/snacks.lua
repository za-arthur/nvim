local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    picker = {
      sources = {
        lsp_definitions = {
          auto_confirm = false,
        },
        lsp_declarations = {
          auto_confirm = false,
        },
        explorer = {
          layout = { preset = "vertical", layout = { max_width = 120, min_width = 40 } },
        }
      },
    },
    explorer = { },
    bigfile = { },
    input = { },
    notifier = { },
    gh = { },
    gitbrowse = { },
  },
  keys = {
    -- Exploer
    { "<leader>ep", function() Snacks.explorer() end, desc = "Explorer popup" },
    { "<leader>ef", function() Snacks.explorer.reveal() end, desc = "Explorer reveal current buffer" },

    -- Git
    { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub issues (open)" },
    { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub pull requests (open)" },
    { "<leader>gl", function() Snacks.gitbrowse() end, desc = "Git Browse" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git diff (hunks)" },

    -- Find
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fc", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Grep word" },
    { "<leader>f/", function() Snacks.picker.lines() end, desc = "Search lines" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
    { "<leader>fr", function() Snacks.picker.resume() end, desc = "Resume" },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>fp", function() Snacks.picker() end, desc = "Pickers" },

    -- LSP
    { "<leader>rd", function() Snacks.picker.lsp_definitions() end, desc = "Goto definition" },
    { "<leader>rD", function() Snacks.picker.lsp_declarations() end, desc = "Goto declaration" },
    { "<leader>rr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "<leader>ri", function() Snacks.picker.lsp_implementations() end, desc = "Goto implementation" },
    { "<leader>rai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls incoming" },
    { "<leader>rao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls outgoing" },
    { "<leader>rs", function() Snacks.picker.lsp_symbols() end, desc = "LSP symbols" },
    { "<leader>rS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP workspace symbols" },
  },
}

return M
