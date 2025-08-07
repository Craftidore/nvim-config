(local utils _G.vim.g.utils)
(local Keymaps utils.keymaps)
(local g _G.vim.g)
(utils.defer.add_deferred (fn []
                            (utils.keymaps.wk_add [{1 :<leader>o
                                                    :group "[O]pen"}]))
  :which-key)
(Keymaps.noremap :n :<leader>oz :<CMD>WhichKey<CR>z=
                 "Open Spell Suggest Picker ([z]= alias)")
(Keymaps.noremap :n :<leader>oc (.. :<CMD>copen<CR><C-w>
                                    (if (not= g.quickfix_auto_height nil)
                                      (tostring g.quickfix_auto_height)
                                      :3)
                                    "_")
                 "Open Qui[c]kfix (:copen alias)")
(Keymaps.noremap :n :<leader>ox (fn [] (utils.scratch.get_scratch :lox_buf))
                 "Open Scratch [x] Buffer")	

