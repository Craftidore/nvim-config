-- [nfnl] lua/lsp/conform_config.fnl
local vim = _G.vim
local function _1_()
  return require("conform").format({async = true, lsp_format = "fallback"})
end
local function _2_(bufnr)
  local disable_filetypes = {c = true, cpp = true}
  if not disable_filetypes[vim.bo[bufnr].filetype] then
    return {timeout_ms = 500, lsp_format = "fallback"}
  else
    return nil
  end
end
return {"stevearc/conform.nvim", event = {"BufWritePre"}, cmd = {"ConformInfo"}, keys = {{"<leader>lF", _1_, mode = "n", desc = "LSP: [F]ormat buffer"}}, opts = {format_on_save = _2_, formatters_by_ft = {lua = {"stylua"}, cpp = {"clangd"}}, notify_on_error = false}}
