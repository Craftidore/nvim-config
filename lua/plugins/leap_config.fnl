(local utils _G.vim.g.utils)
(local api _G.vim.api)
(local noremap utils.keymaps.noremap)
(local leap-config {1 :ggandor/leap.nvim
                    :config (fn [] (local leap (require :leap))
                              (set leap.opts.equivalence_classes
                                   [" \t\r\n" "([{" ")]}" "'\"`"])
                              (set leap.opts.safe_labels {})
                              (noremap [:n :x :o] :s "<Plug>(leap)"
                                       "Leap in current buffer")
                              (noremap :n :S "<Plug>(leap-anywhere)"
                                       "Leap in any open window")
                              (api.nvim_set_hl 0
                                               :LeapBackdrop
                                               {:link :Comment}))
                    :dependencies [[:tpope/vim-repeat]]})
leap-config	


