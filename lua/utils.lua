local Utils = {}
Utils.keymaps = {}
(function()
  local keymap = vim.keymap.set
  function Utils.keymaps.noremap(mode, lhs, rhs, desc)
    if desc == nil then
      desc = 'No description provided'
    end
    keymap(mode, lhs, rhs, { noremap = true, desc = desc })
  end

  function Utils.keymaps.silent(mode, lhs, rhs)
    keymap(mode, lhs, rhs, { noremap = true, silent = true })
  end

  function Utils.keymaps.wk_add(...)
    if Utils.has_plugin('which-key') then
      require('which-key').add(...)
    end
  end
end)()

Utils.ifilter = function(t, filterIter)
  local out = {}

  for k, v in pairs(t) do
    if filterIter(v, k, t) then
      table.insert(out, v)
    end
  end

  return out
end

Utils.kfilter = function(t, filterIter)
  local out = {}

  for k, v in pairs(t) do
    if filterIter(v, k, t) then
      out[k] = v
    end
  end

  return out
end

Utils.set_colorscheme = function(colorscheme)
  -- NOTE: vim.cmd is a table which can be called as a function,
  -- which gives the LSP grief
  local function vim_cmd(arg)
    vim.cmd(arg)
  end
  xpcall(vim_cmd, function()
    vim_cmd('echom Failed to set colorscheme: ' .. tostring(colorscheme))
  end, 'colorscheme ' .. colorscheme)
end

Utils.keys = {}
Utils.keys.escape_keys = function(keys)
  return vim.api.nvim_replace_termcodes(keys, true, false, true)
end
Utils.keys.escape = Utils.keys.escape_keys('<Esc>')
Utils.keys.cr = Utils.keys.escape_keys('<CR>')

Utils.visual = {}
Utils.visual.get_visual_lines = function()
  local curpos_info = vim.fn.getpos('.')
  local visual_end_info = vim.fn.getpos('v')
  local start_lnum
  local end_lnum
  if curpos_info[2] < visual_end_info[2] then
    start_lnum = curpos_info[2]
    end_lnum = visual_end_info[2]
  else
    start_lnum = visual_end_info[2]
    end_lnum = curpos_info[2]
  end
  return { start_lnum, end_lnum }
end

Utils.is_machmotion = function()
  local MACHMOTION = vim.env['MACHMOTION']
  return MACHMOTION ~= nil and MACHMOTION ~= 'false'
end

Utils.which_key = function(fn, err)
  if err == nil then
    err = function(_) end
  end
  xpcall(function()
    local whichkey = require('which-key')
    fn(whichkey)
  end, err)
end

Utils.has_plugin = function(plugin_path)
  local success = true
  local err = function()
    success = false
  end
  xpcall(function()
    local _ = require(plugin_path)
  end, err)
  return success
end

Utils.defer = {}
Utils.defer._deferred = { generic = {} }
Utils.defer.add_deferred = function(fn, label)
  if label == nil then
    label = 'generic'
  end
  if Utils.defer._deferred[label] == nil then
    Utils.defer._deferred[label] = {}
  end
  table.insert(Utils.defer._deferred[label], fn)
end
Utils.defer.run = function(label)
  if label == nil then
    label = 'generic'
  end
  if Utils.defer._deferred[label] == nil then
    return
  end
  for _, v in ipairs(Utils.defer._deferred[label]) do
    v()
  end
end

Utils.marks = {}
Utils.marks.get_mark_row_col = function(mark)
  local cur_buf_id = vim.api.nvim_get_current_buf()
  return vim.api.nvim_buf_get_mark(cur_buf_id, mark)
end

return Utils
