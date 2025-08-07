(local utils _G.vim.g.utils)
(local g _G.vim.g)

(local conjure-config
       {1 :Olical/conjure
        :init (fn []  (set g.conjure#mapping#log_split :els)
                (set g.conjure#mapping#log_vsplit :elv)
                (set g.conjure#mapping#log_tab :elt)
                (set g.conjure#mapping#log_buf :elt)
                (set g.conjure#mapping#log_tab :elt)
                (set g.conjure#mapping#log_toggle :elg)
                (set g.conjure#mapping#log_reset_soft :elr)
                (set g.conjure#mapping#log_reset_hard :elR)
                (set g.conjure#mapping#log_jump_to_latest :ell)
                (set g.conjure#mapping#log_close_visible :elq))})
(utils.defer.add_deferred
  (fn [] (when (utils.plugins.has_plugin :conjure.main)
           (utils.keymaps.wk_add [{1 :<leader>e :group "[E]val with Conjure"}])))
  :which-key)

conjure-config	

