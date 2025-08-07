(local vim _G.vim)
(local utils ((. (require :utils.path) :load_modules) :utils :init.lua))

(tset utils :echom 
  (fn [...]
    (local msgs {})
    (each [_ v (ipairs [...])]
      (table.insert msgs [v]))
    (vim.api.nvim_echo msgs true {})))

(tset utils :set_colorscheme 
  (fn [colorscheme]
    ; NOTE: vim.cmd is a table which can be called as a function,
    ; which gives the LSP grief
    ; local function vim_cmd(arg)
    ;   vim.cmd(arg)
    ; end
    (xpcall vim.cmd
      (fn [] (vim.cmd (.. "echom Failed to set colorscheme: " (tostring colorscheme))))
      (.. "colorscheme " colorscheme))))

(tset utils :is_machmotion 
  (fn []
    (local MACHMOTION (. vim.env :MACHMOTION))
    (and (~= MACHMOTION nil) (~= MACHMOTION :false))))

(tset utils :marks {})
(tset utils.marks :get_mark_row_col 
  (fn [mark]
    (local cur-buf-id (vim.api.nvim_get_current_buf))
    (vim.api.nvim_buf_get_mark cur-buf-id mark)))

utils
