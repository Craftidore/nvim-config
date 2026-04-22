{ 1 "hxueh/beancount.nvim"
  :tag :v1.0.0
  :ft [ :beancount :bean ]
  :dependencies [
                 { 1 "saghen/blink.cmp"
                    :optional true
                    :opts (fn [lazy _]
                              (local opts lazy.opts)
                              ((. table :insert) (. opts :sources :default) :beancount)
                              (tset (. opts :sources :providers)
                                    :beancount
                                    { :name :beancount
                                      :module :beancount.completion.blink
                                      :score_offset 100
                                      :opts { :trigger_characters [ ":" "#" "^" "\"" " " ]}})
                              opts) } 
                  "L3MON4D3/LuaSnip" ]
  :config (fn []
            (local beancount (require :beancount))
            ((. beancount :setup) {:main_bean_file "/var/home/craftidore/repos/beans/Main.bean"})
            ; ((. ts-config :setup) { :ensure_installed [ :beancount ]
            ; (local ts-config (require :nvim-treesitter.configs))
            ;                         :highlight { :enable true }
            ;                         :incremental_selection { :enable true }
            ;                         :indent { :enable true }})
            ) }
