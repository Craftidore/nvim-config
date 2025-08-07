-- [nfnl] lua/utils/keys.fnl
local vim = _G.vim
local escape_keys
local function _1_(keys)
  return vim.api.nvim_replace_termcodes(keys, true, false, true)
end
escape_keys = _1_
local keys = {escape_keys = escape_keys, escape = escape_keys("<Esc>"), cr = escape_keys("<CR>")}
return keys
