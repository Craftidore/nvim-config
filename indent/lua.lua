-- [nfnl] indent/lua.fnl
local vim = _G.vim
local utils = vim.g.utils
local lua_width
if utils.is_machmotion() then
  lua_width = 4
else
  lua_width = 2
end
vim.opt_local["expandtab"] = true
vim.opt_local["shiftwidth"] = lua_width
vim.opt_local["softtabstop"] = lua_width
return nil
