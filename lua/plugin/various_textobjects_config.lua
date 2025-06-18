-- Must be a <cmd> / <cr> thing to be dot-repeatable
local function makeCmd(str)
  return '<cmd>' .. str .. '<cr>'
end

local function makeVarTxtObj(obj, arg1, arg2)
  local args = ''
  if arg2 ~= nil then
    args = [[("]] .. arg1 .. [[", "]] .. arg2 .. [[")]]
  else
    args = [[("]] .. arg1 .. [[")]]
  end
  return makeCmd([[lua require('various-textobjs').]] .. obj .. args)
end

local function makeTextObjKeybind(key, obj, arg1, arg2, desc)
  if desc == nil then
    if arg1 ~= nil and arg2 ~= nil then
      desc = 'select ' .. obj
    elseif arg2 == nil then
      desc = 'select ' .. obj .. ' ' .. arg1
    elseif arg2 ~= nil then
      desc = 'select ' .. obj .. ' ' .. arg1 .. '/' .. arg2
    end
  end
  return {
    key,
    makeVarTxtObj(obj, arg1, arg2),
    mode = { 'x', 'o' },
    desc = desc,
  }
end

local VariousTextObjects = {
  'chrisgrieser/nvim-various-textobjs',
  event = 'VeryLazy',
  opts = {
    keymaps = {
      useDefaults = false,
    },
  },
  keys = {
    -- makeTextObjKeybind('ii', 'indentation', 'inner', 'inner'),
    -- when on unindented line, `ii` should select entire buffer
    {
      'ii',
      function()
        if vim.fn.indent('.') == 0 then
          require('various-textobjs').entireBuffer()
        else
          require('various-textobjs').indentation('inner', 'inner')
        end
      end,
      mode = { 'o', 'x' },
      desc = 'select indentation inner/inner',
    },
    makeTextObjKeybind('ai', 'indentation', 'outer', 'inner'),
    makeTextObjKeybind('ia', 'indentation', 'inner', 'outer'),
    makeTextObjKeybind('aa', 'indentation', 'outer', 'outer'),
    makeTextObjKeybind('is', 'subword', 'inner'),
    makeTextObjKeybind('as', 'subword', 'outer'),
    makeTextObjKeybind('iq', 'anyQuote', 'inner'),
    makeTextObjKeybind('aq', 'anyQuote', 'outer'),
    makeTextObjKeybind('i_', 'lineCharacterwise', 'inner'),
    makeTextObjKeybind('a_', 'lineCharacterwise', 'outer'),
    makeTextObjKeybind('ib', 'anyBracket', 'inner'),
    makeTextObjKeybind('ab', 'anyBracket', 'outer'),
  },
}

return VariousTextObjects
