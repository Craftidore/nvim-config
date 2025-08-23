-- [nfnl] lua/commands/machmotion-commands.fnl
local vim = _G.vim
local api = vim.api
local utils = vim.g.utils
if utils.is_machmotion() then
  local function _1_()
    vim.g["allow_cpp_lsp"] = true
    vim.cmd("LspStart clangd")
    return vim.notify("C++ Lsp enabled", vim.log.levels.INFO)
  end
  return api.nvim_create_user_command("CraftiCppLspEnable", _1_, {})
else
  return nil
end
