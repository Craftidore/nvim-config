(local utils _G.vim.g.utils)
(local Keymaps utils.keymaps)

; Remove last character from line
(Keymaps.noremap :n :X "mz$\"_x`z" "Kill [X] the last character on the line")
