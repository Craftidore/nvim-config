-- [nfnl] lua/plugins/nfnl-config.fnl
local vim = _G.vim
local function _1_()
  vim.g.compile_on_write = true
  return nil
end
return {"Olical/nfnl", ft = "fennel", init = _1_, opts = false}
