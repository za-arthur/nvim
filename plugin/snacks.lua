vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/folke/snacks.nvim",
})

require("snacks").setup({
  picker = {
    sources = {
      lsp_definitions = {
        include_current = true,
        auto_confirm = false,
      },
      lsp_declarations = {
        include_current = true,
        auto_confirm = false,
      },
      lsp_references = {
        include_current = true,
        auto_confirm = false,
      },
      explorer = {
        layout = { preset = "vertical", layout = { max_width = 120, min_width = 40 } },
        auto_close = true,
      },
    },
    actions = {
      sidekick_send = function(...)
        return require("sidekick.cli.picker.snacks").send(...)
      end,
    },
    win = {
      input = {
        keys = {
          ["<a-a>"] = {
            "sidekick_send",
            mode = { "n", "i" },
          },
        },
      },
    },
  },
  explorer = { },
  bigfile = { },
  input = { },
  notifier = { },
  gitbrowse = { },
  terminal = { },
  lazygit = {
    win = {
      width = 0,  -- full width
      height = 0, -- full height
    },
  },
})

--
-- Keymaps
--
local utils = require("utils")

-- Explorer
utils.keymap("<leader>ep", function() Snacks.explorer() end, "Explorer popup")
utils.keymap("<leader>ef", function() Snacks.explorer.reveal() end, "Explorer reveal current buffer")

-- Git
utils.keymap("<leader>gb", function() Snacks.gitbrowse() end, "Git browse")
utils.keymap("<leader>gt", function() Snacks.lazygit() end, "Show lazygit")

-- Find
utils.keymap("<leader>fb", function() Snacks.picker.buffers() end, "Buffers")
utils.keymap("<leader>fc", function() Snacks.picker.commands() end, "Commands")
utils.keymap("<leader>fg", function() Snacks.picker.grep() end, "Grep")
utils.keymap("<leader>fw", function() Snacks.picker.grep_word() end, "Grep word")
utils.keymap("<leader>f/", function() Snacks.picker.lines() end, "Search lines")
utils.keymap("<leader>ff", function() Snacks.picker.files() end, "Find files")
utils.keymap("<leader>fr", function() Snacks.picker.resume() end, "Resume")
utils.keymap("<leader>fh", function() Snacks.picker.help() end, "Help")
utils.keymap("<leader>fk", function() Snacks.picker.keymaps() end, "Keymaps")
utils.keymap("<leader>fu", function() Snacks.picker.undo() end, "Undo history")
utils.keymap("<leader>fp", function() Snacks.picker() end, "Pickers")

-- LSP
utils.keymap("<leader>rd", function() Snacks.picker.lsp_definitions() end, "Goto definition")
utils.keymap("<leader>rD", function() Snacks.picker.lsp_declarations() end, "Goto declaration")
utils.keymap("<leader>rr", function() Snacks.picker.lsp_references() end, "References")
utils.keymap("<leader>ri", function() Snacks.picker.lsp_implementations() end, "Goto implementation")
utils.keymap("<leader>rai", function() Snacks.picker.lsp_incoming_calls() end, "C[a]lls incoming")
utils.keymap("<leader>rao", function() Snacks.picker.lsp_outgoing_calls() end, "C[a]lls outgoing")
utils.keymap("<leader>rs", function() Snacks.picker.lsp_symbols() end, "LSP symbols")
utils.keymap("<leader>rS", function() Snacks.picker.lsp_workspace_symbols() end, "LSP workspace symbols")
utils.keymap("<leader>rc", vim.lsp.buf.code_action, "Select a code action")

-- Terminal
utils.keymap(
  "<c-/>",
  function()
    Snacks.terminal(nil, {
      win = {
        position = "bottom",
        relative = "win",
      },
    })
  end,
  "Toggle terminal (local split)"
)
