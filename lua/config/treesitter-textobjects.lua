local utils = require("utils")

local M = {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    vim.g.no_plugin_maps = true
  end,
  opts = {
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
  },
  keys = {
    --
    -- Select
    --

    -- function
    utils.lazymap("am", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
      end, "function", { "x", "o" }),
    utils.lazymap("im", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
      end, "function", { "x", "o" }),
    -- scope
    utils.lazymap("as", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
      end, "scope", { "x", "o" }),
    -- parameter
    utils.lazymap("ap", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@parameter.outer", "textobjects")
      end, "parameter", { "x", "o" }),
    utils.lazymap("ip", function()
        require "nvim-treesitter-textobjects.select".select_textobject("@parameter.inner", "textobjects")
      end, "parameter", { "x", "o" }),
    --
    -- Move
    --

    -- function
    utils.lazymap("]m", function()
        require "nvim-treesitter-textobjects.move".goto_next_start("@function.outer", "textobjects")
      end, "function", { "n", "x", "o" }),
    utils.lazymap("[m", function()
        require "nvim-treesitter-textobjects.move".goto_previous_start("@function.outer", "textobjects")
      end, "function", { "n", "x", "o" }),
    utils.lazymap("]M", function()
        require "nvim-treesitter-textobjects.move".goto_next_end("@function.outer", "textobjects")
      end, "function", { "n", "x", "o" }),
    utils.lazymap("[M", function()
        require "nvim-treesitter-textobjects.move".goto_previous_end("@function.outer", "textobjects")
      end, "function", { "n", "x", "o" }),
    -- parameter
    utils.lazymap("]p", function()
        require "nvim-treesitter-textobjects.move".goto_next_start("@parameter.inner", "textobjects")
      end, "parameter", { "n", "x", "o" }),
    utils.lazymap("[p", function()
        require "nvim-treesitter-textobjects.move".goto_previous_start("@parameter.inner", "textobjects")
      end, "parameter", { "n", "x", "o" }),
    -- return
    utils.lazymap("]r", function()
        require "nvim-treesitter-textobjects.move".goto_next_start("@return.inner", "textobjects")
      end, "return", { "n", "x", "o" }),
    utils.lazymap("[r", function()
        require "nvim-treesitter-textobjects.move".goto_previous_start("@return.inner", "textobjects")
      end, "return", { "n", "x", "o" }),
  },
  config = function(_, _)
    local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

    -- Repeat movement with ; and ,
    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
  end,
}

return M
