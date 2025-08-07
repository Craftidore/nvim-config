-- [nfnl] lua/options/formatoptions.fnl
local o = _G.vim.o
local opt = _G.vim.opt
local utils = _G.vim.g.utils
opt.formatoptions:append("t")
opt.formatoptions:remove("l")
opt.formatoptions:remove("r")
opt.formatoptions:remove("o")
return nil
