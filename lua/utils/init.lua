local M = {}

function M.is_large(_, buf)
  local max_filesize = 100 * 1024 -- 100 KB
  local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
  if ok and stats and stats.size > max_filesize then
    return true
  end
end

function M.warn(msg, notify_opts)
  vim.notify(msg, vim.log.levels.WARN, notify_opts)
end

function M.error(msg, notify_opts)
  vim.notify(msg, vim.log.levels.ERROR, notify_opts)
end

function M.info(msg, notify_opts)
  vim.notify(msg, vim.log.levels.INFO, notify_opts)
end

function M.toggle(option, silent, values)
  if values then
    if vim.opt_local[option]:get() == values[1] then
      vim.opt_local[option] = values[2]
    else
      vim.opt_local[option] = values[1]
    end
    return require("utils").info("Set " .. option .. " to " .. vim.opt_local[option]:get(), { title = "Option" })
  end
  vim.opt_local[option] = not vim.opt_local[option]:get()
  if not silent then
    if vim.opt_local[option]:get() then
      require("utils").info("Enabled " .. option, { title = "Option" })
    else
      require("utils").warn("Disabled " .. option, { title = "Option" })
    end
  end
end

M.diagnostics_active = true
function M.toggle_diagnostics()
  M.diagnostics_active = not M.diagnostics_active
  if M.diagnostics_active then
    vim.diagnostic.show()
    require("utils").info("Enabled Diagnostics", { title = "Lsp" })
  else
    vim.diagnostic.hide()
    require("utils").warn("Disabled Diagnostics", { title = "Lsp" })
  end
end

return M
