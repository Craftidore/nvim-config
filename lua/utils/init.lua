-- [nfnl] lua/utils/init.fnl
local vim = _G.vim
local utils = require("utils.path").load_modules("utils", "init.lua")
local function _1_(...)
  local msgs = {}
  for _, v in ipairs({...}) do
    table.insert(msgs, {v})
  end
  return vim.api.nvim_echo(msgs, true, {})
end
utils["echom"] = _1_
local function _2_(colorscheme)
  local function _3_()
    return vim.cmd(("echom Failed to set colorscheme: " .. tostring(colorscheme)))
  end
  return xpcall(vim.cmd, _3_, ("colorscheme " .. colorscheme))
end
utils["set_colorscheme"] = _2_
local function _4_()
  local MACHMOTION = vim.env.MACHMOTION
  return ((MACHMOTION ~= nil) and (MACHMOTION ~= "false"))
end
utils["is_machmotion"] = _4_
utils["marks"] = {}
local function _5_(mark)
  local cur_buf_id = vim.api.nvim_get_current_buf()
  return vim.api.nvim_buf_get_mark(cur_buf_id, mark)
end
utils.marks["get_mark_row_col"] = _5_
return utils
