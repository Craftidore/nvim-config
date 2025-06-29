-- Crafti's Options (autoloaded)
local o = vim.o
local opt = vim.opt
local utils = vim.g.utils

o.number = true
o.relativenumber = true

-- Show mode in status line
o.showmode = false
-- When wrap is on, break indent
o.breakindent = true
o.linebreak = true

o.undofile = true

o.ignorecase = true
o.smartcase = true

o.signcolumn = 'yes'

o.updatetime = 250

o.splitright = true
o.splitbelow = true

-- Displays whitespace differently
o.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Shows substitutions live
o.inccommand = 'split'

o.cursorline = true
o.cursorcolumn = true

o.confirm = true

opt.colorcolumn = { vim.g.text_width }

o.undofile = true
o.undolevels = 1000 -- default

o.scrolloff = 1
