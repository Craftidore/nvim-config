local o = vim.o
local opt = vim.opt
local utils = vim.g.utils

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
