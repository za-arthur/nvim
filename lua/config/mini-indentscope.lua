local M = {}

function M.setup()
  require("mini.indentscope").setup {
    draw = {
      animation = require('mini.indentscope').gen_animation.none()
    },
  }
end

return M
