vim.pack.add({
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    version = "main",
  }
})

-- Disable entire built-in ftplugin mappings to avoid conflicts.
-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
vim.g.no_plugin_maps = true

require("nvim-treesitter-textobjects").setup({
  select = {
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,
    selection_modes = {
      ['@parameter.outer'] = 'v', -- charwise
      ['@function.outer'] = 'V', -- linewise
    },
  },
  move = {
    set_jumps = true,
  },
})

--
-- Select keymaps
--
local utils = require("utils")

-- function
utils.keymap("am", function()
    require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
  end, "function", { "x", "o" })
utils.keymap("im", function()
    require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
  end, "function", { "x", "o" })
-- scope
utils.keymap("as", function()
    require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
  end, "scope", { "x", "o" })
-- parameter
utils.keymap("ap", function()
    require "nvim-treesitter-textobjects.select".select_textobject("@parameter.outer", "textobjects")
  end, "parameter", { "x", "o" })
utils.keymap("ip", function()
    require "nvim-treesitter-textobjects.select".select_textobject("@parameter.inner", "textobjects")
  end, "parameter", { "x", "o" })

--
-- Move keymaps
--

-- function
utils.keymap("]m", function()
    require "nvim-treesitter-textobjects.move".goto_next_start("@function.outer", "textobjects")
  end, "function", { "n", "x", "o" })
utils.keymap("[m", function()
    require "nvim-treesitter-textobjects.move".goto_previous_start("@function.outer", "textobjects")
  end, "function", { "n", "x", "o" })
utils.keymap("]M", function()
    require "nvim-treesitter-textobjects.move".goto_next_end("@function.outer", "textobjects")
  end, "function", { "n", "x", "o" })
utils.keymap("[M", function()
    require "nvim-treesitter-textobjects.move".goto_previous_end("@function.outer", "textobjects")
  end, "function", { "n", "x", "o" })
-- parameter
utils.keymap("]p", function()
    require "nvim-treesitter-textobjects.move".goto_next_start("@parameter.inner", "textobjects")
  end, "parameter", { "n", "x", "o" })
utils.keymap("[p", function()
    require "nvim-treesitter-textobjects.move".goto_previous_start("@parameter.inner", "textobjects")
  end, "parameter", { "n", "x", "o" })
-- return
utils.keymap("]r", function()
    require "nvim-treesitter-textobjects.move".goto_next_start("@return.inner", "textobjects")
  end, "return", { "n", "x", "o" })
utils.keymap("[r", function()
    require "nvim-treesitter-textobjects.move".goto_previous_start("@return.inner", "textobjects")
  end, "return", { "n", "x", "o" })

local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

-- Repeat movement with ; and ,
utils.keymap(";", ts_repeat_move.repeat_last_move, "Repeat", { "n", "x", "o" })
utils.keymap(",", ts_repeat_move.repeat_last_move_opposite, "repeat opposite", { "n", "x", "o" })
