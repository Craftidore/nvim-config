local g = vim.g
local o = vim.o
local opt = vim.opt

-- Leader key
g.mapleader = ' '
g.maplocalleader = ' '
vim.keymap.set('', '<Space>', '<Nop>', { noremap = true, silent = true })

-- For checking in plugin configs
g.have_nerd_font = true

o.number = true
o.relativenumber = true

-- Show mode in status line
o.showmode = false
-- When wrap is on, break indent
o.breakindent = true

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

local textMax = 80
opt.colorcolumn = { textMax }

-- NOTE: Handled by plugin
-- local tab_options = { "tabstop",
--     "softtabstop", "shiftwidth" }
-- -- opt.vartabstop = {2,4,4,4,8,20}
-- local tab_width = 2
-- for i = 1, #tab_options do
-- 	opt[tab_options[i]] = tab_width
-- end
-- opt.expandtab = true
