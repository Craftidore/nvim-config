-- [nfnl] ftplugin/cpp.fnl
local vim = _G.vim
local utils = vim.g.utils
if utils.is_machmotion() then
  return vim.treesitter.start()
else
  return nil
end
