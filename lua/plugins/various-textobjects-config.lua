-- [nfnl] lua/plugins/various-textobjects-config.fnl
local function makeCmd(str)
  return ("<cmd>" .. str .. "<cr>")
end
local function make_var_txt_obj(obj, arg1, arg2)
  local args = ""
  if (arg2 ~= nil) then
    args = ("(\"" .. arg1 .. "\", \"" .. arg2 .. "\")")
  else
    args = ("(\"" .. arg1 .. "\")")
  end
  return makeCmd(("lua require('various-textobjs')." .. obj .. args))
end
local function make_text_obj_keybind(key, obj, arg1, arg2, _3fdesc)
  local desc = _3fdesc
  if (desc == nil) then
    if ((arg1 ~= nil) and (arg2 ~= nil)) then
      desc = ("select " .. obj)
    elseif (arg2 == nil) then
      desc = ("select " .. obj .. " " .. arg1)
    elseif (arg2 ~= nil) then
      desc = ("select " .. obj .. " " .. arg1 .. "/" .. arg2)
    else
    end
  else
  end
  return {key, make_var_txt_obj(obj, arg1, arg2), mode = {"x", "o"}, desc = desc}
end
local function _4_()
  if (_G.vim.fn.indent(".") == 0) then
    return require("various-textobjs").entireBuffer()
  else
    return require("various-textobjs").indentation("inner", "inner")
  end
end
return {"chrisgrieser/nvim-various-textobjs", event = "VeryLazy", opts = {keymaps = {useDefaults = false}}, keys = {{"ii", _4_, mode = {"o", "x"}, desc = "select indentation inner/inner"}, make_text_obj_keybind("ai", "indentation", "outer", "inner"), make_text_obj_keybind("ia", "indentation", "inner", "outer"), make_text_obj_keybind("aa", "indentation", "outer", "outer"), make_text_obj_keybind("is", "subword", "inner"), make_text_obj_keybind("as", "subword", "outer"), make_text_obj_keybind("iq", "anyQuote", "inner"), make_text_obj_keybind("aq", "anyQuote", "outer"), make_text_obj_keybind("i_", "lineCharacterwise", "inner"), make_text_obj_keybind("a_", "lineCharacterwise", "outer"), make_text_obj_keybind("ib", "anyBracket", "inner"), make_text_obj_keybind("ab", "anyBracket", "outer")}}
