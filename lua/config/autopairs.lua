local M = {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true,
    ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
  },
  config = function(_, opts)
    local npairs = require("nvim-autopairs")
    local Rule = require("nvim-autopairs.rule")
    local cond = require("nvim-autopairs.conds")

    npairs.setup(opts)

    -- Define the filetypes where you want triple quotes to behave this way
    local ft = { "python", "lua", "markdown", "codecompanion" }

    npairs.add_rules({
      -- Rule for triple single quotes: '''
      Rule("'''", "'''", ft)
        :with_pair(cond.not_after_text("'"))
        :with_pair(function(opts_rule)
          local last_two = opts_rule.line:sub(opts_rule.col - 2, opts_rule.col - 1)
          return last_two == "''"
        end),
        
      -- Rule for triple double quotes: """
      Rule('"""', '"""', ft)
        :with_pair(cond.not_after_text('"'))
        :with_pair(function(opts_rule)
          local last_two = opts_rule.line:sub(opts_rule.col - 2, opts_rule.col - 1)
          return last_two == '""'
        end)
    })
  end,
}

return M
