(local o _G.vim.o)
(local opt _G.vim.opt)
(local utils _G.vim.g.utils)

; Fold source-of-truth:
; See https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
(set opt.foldmethod :indent)
(utils.defer.add_deferred
  (fn [] (set opt.foldmethod :expr)
         (set opt.foldexpr "v:lua.vim.treesitter.foldexpr()"))
  :nvim-treesitter)
(set opt.foldtext "") ;  just use the normal line with TS syntax highlighting
(set o.foldlevel 99)
(set o.foldlevelstart 3)
(set o.foldnestmax 4)
