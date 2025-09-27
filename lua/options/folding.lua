-- [nfnl] lua/options/folding.fnl
local o = _G.vim.o
local opt = _G.vim.opt
local utils = _G.vim.g.utils
opt.foldmethod = "indent"
local function _1_()
  opt.foldmethod = "expr"
  opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  return nil
end
utils.defer.add_deferred(_1_, "nvim-treesitter")
opt.foldtext = ""
o.foldlevel = 99
o.foldlevelstart = 3
o.foldnestmax = 4
return nil
