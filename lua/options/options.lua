-- [nfnl] lua/options/options.fnl
local o = _G.vim.o
local opt = _G.vim.opt
local g = _G.vim.g
local utils = g.utils
o.number = true
o.relativenumber = true
o.showmode = false
o.breakindent = true
o.linebreak = true
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes"
o.updatetime = 250
o.splitright = true
o.splitbelow = true
o.list = true
opt.listchars = {tab = "\194\187 ", trail = "\194\183", nbsp = "\226\144\163"}
o.inccommand = "split"
o.cursorline = true
o.cursorcolumn = true
o.confirm = true
opt.colorcolumn = {g.text_width}
o.undofile = true
o.undolevels = 1000
o.scrolloff = 1
return nil
