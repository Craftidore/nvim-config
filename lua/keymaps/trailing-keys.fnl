(local utils _G.vim.g.utils)
(local Keymaps utils.keymaps)

; NOTE: Trailing punctuation (no namespace)
(local trailing-keys
  ["," ";" ":" "\"" "'" "(" ")" "[" "]" "{" "}" "\\" "/" "."])
(for [i 1 (length trailing-keys)]
  (local key (. trailing-keys i))
  (Keymaps.noremap :n (.. :<leader> key) (.. :mzA key "<Esc>`z")
                   (.. "Add " key " to end of current line"))
  (utils.defer.add_deferred
    (fn [] (utils.keymaps.wk_add [{1 (.. :<leader> key) :hidden true}]))
    :which-key))	
