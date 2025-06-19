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

return Utils
