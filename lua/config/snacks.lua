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
      },
    },
    bigfile = { },
    input = { },
    notifier = { },
    gh = { },
    gitbrowse = { },
  },
  keys = {
    -- Git
    { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
    { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
    { "<leader>gl", function() Snacks.gitbrowse() end, desc = "Git Browse" },

    -- Find
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fc", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>f/", function() Snacks.picker.lines() end, desc = "Search lines" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fr", function() Snacks.picker.resume() end, desc = "Resume" },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },

    -- LSP
    { "<leader>rd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "<leader>rD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "<leader>rr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "<leader>ri", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "<leader>rai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
    { "<leader>rao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
    { "<leader>rs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "<leader>rS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  },
}

return M
