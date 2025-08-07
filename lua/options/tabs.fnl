(local o _G.vim.o)
(local opt _G.vim.opt)
(local utils _G.vim.g.utils)

; Guess Indent handles this, but for empty files...
(local tab_options [ :tabstop :softtabstop :shiftwidth ])
(local tab_width 4)
(for [i 1 (# tab_options)]
  (tset opt (. tab_options i) tab_width))
(set opt.expandtab (not (utils.is_machmotion)))
