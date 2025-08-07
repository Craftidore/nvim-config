; Crafti's Options (autoloaded)
(local o _G.vim.o)
(local opt _G.vim.opt)
(local g _G.vim.g)
(local utils g.utils)

(set o.number true)
(set o.relativenumber true)

; Show mode in status line
(set o.showmode false)
; When wrap is on, break indent
(set o.breakindent true)
(set o.linebreak true)

(set o.undofile true)

(set o.ignorecase true)
(set o.smartcase true)

(set o.signcolumn :yes)

(set o.updatetime 250)

(set o.splitright true)
(set o.splitbelow true)

; Displays whitespace differently
(set o.list true)
(set opt.listchars { :tab "» " :trail "·" :nbsp "␣" })

; Shows substitutions live
(set o.inccommand :split)

(set o.cursorline true)
(set o.cursorcolumn true)

(set o.confirm true)

(set opt.colorcolumn [g.text_width])

(set o.undofile true)
(set o.undolevels 1000) ; default

(set o.scrolloff 1)
