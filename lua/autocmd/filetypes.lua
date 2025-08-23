-- [nfnl] lua/autocmd/filetypes.fnl
local vim = _G.vim
local api = vim.api
local utils = vim.g.utils
local group = "crafti-filetype"
api.nvim_create_augroup(group, {clear = true})
local function _1_()
  if (utils.is_machmotion() and (vim.b.allow_cpp_lsp ~= true) and (vim.g.allow_cpp_lsp ~= true)) then
    vim.cmd("LspStop")
    vim.notify("C++ Lsp disabled", vim.log.levels.INFO)
  else
  end
  return nil
end
api.nvim_create_autocmd({"LspAttach"}, {pattern = {"*.cpp", "*.hpp", "*.h", "*.c"}, group = group, desc = "Default-disable C++ LSP if in MachMotion env", callback = _1_})
local function _3_()
  vim.bo.formatoptions = (vim.bo.formatoptions .. "cro")
  return nil
end
return api.nvim_create_autocmd({"BufEnter", "BufCreate"}, {pattern = {"*.tex"}, group = group, desc = "Default-add comment wrap/continue for TeX buffer", callback = _3_})
