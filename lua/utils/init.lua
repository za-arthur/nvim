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

function M.lazymap(lhs, rhs, desc, mode, opts)
  local options = {
    lhs,
    rhs,
    mode = mode or "n",
    desc = desc,
    noremap = true,
    silent = true,
  }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  return options
end

function M.keymap(lhs, rhs, desc, mode, opts)
  local options = {
    desc = desc,
    noremap = true,
    silent = true
  }
  mode = mode or "n"

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.keymap.set(mode, lhs, rhs, options)
end

-- Function to close all buffers except visible ones and unsaved ones
function M.close_other_buffers()
  local current_tabpage = vim.api.nvim_get_current_tabpage()
  local visible_buffers = {}

  -- Get all windows in the current tab
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(current_tabpage)) do
    local buf = vim.api.nvim_win_get_buf(win)
    visible_buffers[buf] = true
  end

  -- Iterate through all buffers
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local modified = vim.bo[buf].modified

    -- Skip visible buffers and unsaved (modified) buffers
    if not visible_buffers[buf] and not modified then
      vim.cmd('bwipeout ' .. buf)
    end
  end
end

return M
