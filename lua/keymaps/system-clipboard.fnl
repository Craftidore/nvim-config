(local utils vim.g.utils)
(local Keymaps utils.keymaps)
(local copy-paste-modes [:n :x])
(local copy-paste-keys [:y :p :P :d :D :c :C])
(each [_ m (ipairs copy-paste-modes)]
  (each [_ k (ipairs copy-paste-keys)]
    (Keymaps.noremap m (.. :<leader> k) (.. "\"+" k)
                     (.. "Perform " k " to system clipboard"))
    (utils.defer.add_deferred
      (fn [] (utils.keymaps.wk_add [{1 (.. :<leader> k) :hidden true}]))
      :which-key)))
(Keymaps.noremap [:n :x] :<leader>Y "\"+y$" "Perform Y to system clipboard")
(utils.defer.add_deferred
  (fn [] (utils.keymaps.wk_add [{1 :<leader>Y :hidden true}])))	


