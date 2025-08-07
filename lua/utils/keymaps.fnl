(local vim _G.vim)
(local keymap vim.keymap.set)
(local keymaps 
  { :noremap (fn [mode lhs rhs ?desc]
               (var desc ?desc)
               (if (= ?desc nil) (set desc "No description provided"))
               (keymap mode lhs rhs { :noremap true :desc desc }))

    :silent (fn [mode lhs rhs]
              (keymap mode lhs rhs { :noremap true :silent true }))

    :wk_add (fn [...]
              (when ((. (require :utils.plugins) :has_plugin) :which-key)
                ((. (require :which-key) :add) ...))) })

keymaps
