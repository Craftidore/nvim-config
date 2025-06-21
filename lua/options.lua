local g = vim.g
local o = vim.o
local opt = vim.opt
local utils = require('utils')
-- Used by c_CTRL-f keymap
g.cmdline_auto_height = 3
-- Used by <leader>oc keymap
g.quickfix_auto_height = 3

-- Global Winblend, for use with anything that asks for winblend
g.winblend = 30

-- Leader key
g.mapleader = ' '
g.maplocalleader = ' '
utils.keymaps.silent('', '<Space>', '<Nop>')

-- For checking in plugin configs
g.have_nerd_font = true

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

local textMax = 80
opt.colorcolumn = { textMax }

-- Fold source-of-truth:

-- See https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
opt.foldmethod = 'indent'
utils.defer.add_deferred(function()
  opt.foldmethod = 'expr'
  opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
end, 'nvim-treesitter')
opt.foldtext = '' --  just use the normal line with TS syntax highlighting
opt.foldlevel = 99
opt.foldlevelstart = 2
opt.foldnestmax = 4

-- NOTE: Handled by plugin
-- local tab_options = { "tabstop",
--     "softtabstop", "shiftwidth" }
-- -- opt.vartabstop = {2,4,4,4,8,20}
-- local tab_width = 2
-- for i = 1, #tab_options do
--   opt[tab_options[i]] = tab_width
-- end
-- opt.expandtab = true
