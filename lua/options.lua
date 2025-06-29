local o = vim.o
local opt = vim.opt
local utils = vim.g.utils
utils.keymaps.silent('', '<Space>', '<Nop>')

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
opt.formatoptions:append({ 't' }) -- Autowrap at text-width at end-of-line
opt.formatoptions:remove({ 'l' }) -- If disabled, autowrap even if you're adding to a line that's already >textwidth
opt.formatoptions:remove({ 'r' }) -- Add * to multi-line comments after <CR>
opt.formatoptions:remove({ 'o' }) -- Add * to multi-line comments after o/O

o.undofile = true
o.undolevels = 1000 -- default

-- Fold source-of-truth:
-- See https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
opt.foldmethod = 'indent'
utils.defer.add_deferred(function()
  opt.foldmethod = 'expr'
  opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
end, 'nvim-treesitter')
opt.foldtext = '' --  just use the normal line with TS syntax highlighting
o.foldlevel = 99
o.foldlevelstart = 2
o.foldnestmax = 4

-- Guess Indent handles this, but for empty files...
local tab_options = { 'tabstop', 'softtabstop', 'shiftwidth' }
local tab_width = 4
for i = 1, #tab_options do
  opt[tab_options[i]] = tab_width
end
opt.expandtab = not utils.is_machmotion()

o.scrolloff = 1
