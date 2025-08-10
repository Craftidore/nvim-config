-- [nfnl] lua/lsp/nvim-lint-config.fnl
local vim = _G.vim
local function lint_ignore(ft)
  local ignored_filetypes = {"help", "ministarter", "TelescopePrompt", "mason", "lazy"}
  local contains = vim.g.utils.lua.contains
  local bad_ft = contains(ignored_filetypes, ft)
  return bad_ft
end
local function _1_()
  local lint = require("lint")
  lint["linters_by_ft"] = {cpp = {"cpplint"}}
  return nil
end
local function _2_()
  local function _3_(ev)
    local filetype = vim.api.nvim_get_option_value("filetype", {buf = ev.buf})
    if not lint_ignore(filetype) then
      local lint = require("lint")
      lint.try_lint()
      lint.try_lint("typos")
      if (vim.b.editorconfig ~= nil) then
        return lint.try_lint("editorconfig-checker")
      else
        return nil
      end
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost"}, {callback = _3_})
end
return {"mfussenegger/nvim-lint", config = _1_, init = _2_, cond = false, lazy = false}
