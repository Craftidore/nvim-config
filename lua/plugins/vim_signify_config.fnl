(local vim _G.vim)
(local utils vim.g.utils)

(local vim-signify-conf
  { 1 :mhinz/vim-signify
    :lazy false
    :enabled utils.is_machmotion
    :init (fn [] (set vim.o.updatetime 100))})

; FIX: This seems like it's not doing what it should; this should be an autocmd, right?
(vim.cmd
  "highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
   highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
   highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE")

vim-signify-conf
