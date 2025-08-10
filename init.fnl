(local vim _G.vim)
(tset vim.g :utils (require :utils))
(local utils vim.g.utils)

; Some keymaps require custom vim.g opts, so that's first
(require :vim-g-opts)
; Some autocmds react to Lazy/colorscheme things
(require :autocmd)

; Lazy calls defer.run('lazy'), which is used by keymaps->whichkey
(require :lazy-config)

(if (not (utils.is_machmotion))
  (utils.set_colorscheme :duskfox)
  (utils.set_colorscheme :kanagawa))

