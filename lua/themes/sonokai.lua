-- [nfnl] lua/themes/sonokai.fnl
local vim = _G.vim
local function _1_()
  vim.g.sonokai_style = "espresso"
  vim.g.sonokai_enable_italic = true
  return nil
end
return {"sainnhe/sonokai", priority = 1000, init = _1_}
