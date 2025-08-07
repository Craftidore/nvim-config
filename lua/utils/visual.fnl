(local vim _G.vim)
{ :get_visual_lines
  (fn []
    (local curpos-info (vim.fn.getpos :.))
    (local visual-end-info (vim.fn.getpos :v))
    (var start-lnum nil)
    (var end-lnum nil)
    (if (< (. curpos-info 2) (. visual-end-info 2))
       (do (set start-lnum (. curpos-info 2))
           (set end-lnum (. visual-end-info 2)))
       (do (set start-lnum (. visual-end-info 2))
           (set end-lnum (. curpos-info 2))))
    [ start-lnum end-lnum ]) }

