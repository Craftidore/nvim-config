(local utils vim.g.utils)
(fn make-cmd [key func desc] {1 key 2 func : desc :mode :n})
(fn harpoon-add []
  (let [harpoon (require :harpoon)] (: (harpoon:list) :add)))
(fn harpoon-show-list []
  (let [harpoon (require :harpoon)]
    (harpoon.ui:toggle_quick_menu (harpoon:list))))
(fn harpoon-go-to [num]
  (let [harpoon (require :harpoon)] (: (harpoon:list) :select num)))
(fn harpoon-next []
  (let [harpoon (require :harpoon)] (: (harpoon:list) :next)))
(fn harpoon-prev []
  (let [harpoon (require :harpoon)] (: (harpoon:list) :prev)))
(local Harpoon {1 :ThePrimeagen/harpoon
                :branch :harpoon2
                :dependencies [:nvim-lua/plenary.nvim]
                :keys [(make-cmd :<leader>hh harpoon-add "Harpoon: Add to list")
                       (make-cmd :<leader>ho harpoon-show-list
                                 "Harpoon: Show list")
                       (make-cmd :<leader>ha (fn [] (harpoon-go-to 1))
                                 "Harpoon: GoTo 1")
                       (make-cmd :<leader>hs (fn [] (harpoon-go-to 2))
                                 "Harpoon: GoTo 2")
                       (make-cmd :<leader>hd (fn [] (harpoon-go-to 3))
                                 "Harpoon: GoTo 3")
                       (make-cmd :<leader>hf (fn [] (harpoon-go-to 4))
                                 "Harpoon: GoTo 4")
                       (make-cmd :<leader>hg (fn [] (harpoon-go-to 5))
                                 "Harpoon: GoTo 5")
                       (make-cmd :<leader>hn harpoon-next "Harpoon: Next")
                       (make-cmd :<leader>hp harpoon-prev "Harpoon: Prev")
                       (make-cmd :<leader>hl "<CMD>b#<CR>"
                                 "Harpoon: Swap-to-previous-buffer (not harpoon)")]
                :opts {}})
(utils.defer.add_deferred (fn []
                            (when (utils.plugins.has_plugin :harpoon)
                              (utils.keymaps.wk_add [{1 :<leader>h
                                                      :group "[H]arpoon"}])))
  :which-key)
Harpoon	

