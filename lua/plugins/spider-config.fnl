(local vim _G.vim)
(local utils vim.g.utils)
(local spider-config 
  { 1 :chrisgrieser/nvim-spider })
(set spider-config.last_spider :w)

(local default-modes [ :n :o :x ])
(fn spider-motion [key]
  (.. "<cmd>lua "
      "require('plugins.spider-config').last_spider = "
      key
      "; "
      "require('spider').motion('"
      key
      "')"
      "<CR>"))


(fn do-last-spider []
  (spider-motion spider-config.last_spider))

(set spider-config.keys
  [ { 1 :<leader>kw 2 (spider-motion :w) :mode default-modes :desc "Spider [k]: CamelCase [w]" }
    { 1 :<leader>ke 2 (spider-motion :e) :mode default-modes :desc "Spider [k]: CamelCase [e]" }
    { 1 :<leader>kb 2 (spider-motion :b) :mode default-modes :desc "Spider [k]: CamelCase [b]" }
    { 1 :<leader>kn 2 (do-last-spider)   :mode default-modes :desc "Spider [k]: Repeat last spider command" } ])

(utils.defer.add_deferred (fn []
  (when (utils.plugins.has_plugin :spider)
    (utils.keymaps.wk_add
     [ { 1 :<leader>k :group "Spider [k] Motions" } ])))
  :which-key)

spider-config

