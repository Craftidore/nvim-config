(local vim _G.vim)
; WARN: I'm inclined to change how this works later;
;       I'll probably want to use it for better things than just <leader>ox
{ :get_scratch (fn [?id]
  (local atoz :abcdefghijklmnopqrstuvwxyz)
  (var id (if (= ?id nil)
            (do (var gen-id "")
              (for [_ 1 10]
                (set gen-id (.. gen-id (. atoz (math.random 1 26)))))
              gen-id)
            ?id))
  (vim.cmd (.. "vsplit _sb_" id))
  (vim.cmd "
    normal! ggdG
    setlocal filetype=scratch
    setlocal buftype=nofile
    setlocal nobuflisted
  "))}

