-- [nfnl] lua/utils/keymaps.fnl
local vim = _G.vim
local keymap = vim.keymap.set
local keymaps
local function _1_(mode, lhs, rhs, _3fdesc)
  local desc = _3fdesc
  if (_3fdesc == nil) then
    desc = "No description provided"
  else
  end
  return keymap(mode, lhs, rhs, {noremap = true, desc = desc})
end
local function _3_(mode, lhs, rhs)
  return keymap(mode, lhs, rhs, {noremap = true, silent = true})
end
local function _4_(...)
  if require("utils.plugins").has_plugin("which-key") then
    return require("which-key").add(...)
  else
    return nil
  end
end
keymaps = {noremap = _1_, silent = _3_, wk_add = _4_}
return keymaps
