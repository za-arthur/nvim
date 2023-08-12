local M = {}

function M.setup()
  require("neogit").setup {
    disable_commit_confirmation = true,
  }
end

return M
