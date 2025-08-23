-- [nfnl] ftplugin/markdown.fnl
local vim = _G.vim
local g = vim.g
local api = vim.api
if (g.text_width ~= nil) then
  return api.nvim_set_option_value("textwidth", g.text_width, {scope = "local"})
else
  return nil
end
