(local utils _G.vim.g.utils)
(local Keymaps utils.keymaps)
(local api _G.vim.api)
(Keymaps.noremap [:v] :<C-k>
                 (fn []
                   (let [lines (utils.visual.get_visual_lines)
                         diff (- (. lines 2) (. lines 1))
                         keys (.. "<Esc><CMD>'<,'>m '>-" (tostring (+ diff 2))
                                  :<CR>gv=gv)]
                     (api.nvim_feedkeys (utils.keys.escape_keys keys) :v false)))
                 "Move selected lines up")

(Keymaps.noremap [:v] :<C-j>
                 (fn []
                   (let [lines (utils.visual.get_visual_lines)
                         diff (- (. lines 2) (. lines 1))
                         keys (.. "<Esc><CMD>'<,'>m '<+" (tostring (+ diff 1))
                                  :<CR>gv=gv)]
                     (api.nvim_feedkeys (utils.keys.escape_keys keys) :v false)))
                 "Move selected lines down")
