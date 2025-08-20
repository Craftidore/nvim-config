-- [nfnl] ftplugin/cpp.fnl
local vim = _G.vim
local utils = vim.g.utils
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local group = "crafti-cpp-filetype"
augroup(group, {clear = true})
local function _1_()
  if utils.is_machmotion() then
    return vim.treesitter.start()
  else
    return nil
  end
end
return autocmd({"FileType"}, {group = group, pattern = "cpp", callback = _1_})
