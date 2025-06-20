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
Utils.defer.add_defered = function(fn, label)
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
