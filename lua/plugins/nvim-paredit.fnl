(local g _G.vim.g)
(local utils g.utils)
(local nvim-paredit
  { 1 "julienvincent/nvim-paredit"
    :config
    (fn []
      (local paredit (require :nvim-paredit))
      ((. (require :nvim-paredit) :setup)
        {:keys
         { "<localleader>@" false
           ">)" false
           ">(" false
           "<)" false
           "<(" false
           ">e" false
           "<e" false
           ">p" false
           "<p" false
           ">f" false
           "<f" false
           "<localleader>o" false
           "<localleader>O" false
           "E" false
           "W" false
           "B" false
           "gE" false
           "(" false
           ")" false
           "T" false
           "<localleader>s@" [ paredit.unwrap.unwrap_form_under_cursor "Splice sexp" ]
           "<localleader>s)l" [ paredit.api.slurp_forwards "Slurp forwards" ]
           "<localleader>s(l" [ paredit.api.barf_backwards "Barf backwards" ]

           "<localleader>s)h" [ paredit.api.barf_forwards "Barf forwards" ]
           "<localleader>s(h" [ paredit.api.slurp_backwards "Slurp backwards" ]

           "<localleader>sel" [ paredit.api.drag_element_forwards "Drag element right" ]
           "<localleader>seh" [ paredit.api.drag_element_backwards "Drag element left" ]

           "<localleader>spl" [ paredit.api.drag_pair_forwards "Drag element pairs right" ]
           "<localleader>sph" [ paredit.api.drag_pair_backwards "Drag element pairs left" ]

           "<localleader>sfl" [ paredit.api.drag_form_forwards "Drag form right" ]
           "<localleader>sfh" [ paredit.api.drag_form_backwards "Drag form left" ]

           :<localleader>so [ paredit.api.raise_form "Raise form" ]
           :<localleader>sO [ paredit.api.raise_form "Raise element" ]

           "<localleader>sE"
           { 1 paredit.api.move_to_next_element_tail
             2 "Jump to next element tail"
             ; by default all keybindings are dot repeatable
             :repeatable false
             :mode ["n" "x" "o" "v"]}
           "<localleader>sW"
           { 1 paredit.api.move_to_next_element_head
             2 "Jump to next element head"
             :repeatable false
             :mode ["n" "x" "o" "v"]}
           "<localleader>sB"
           { 1 paredit.api.move_to_prev_element_head
             2 "Jump to previous element head"
             :repeatable false
             :mode ["n" "x" "o" "v"]}
           "<localleader>sgE"
           { 1 paredit.api.move_to_prev_element_tail
             2 "Jump to previous element tail"
             :repeatable false
             :mode ["n" "x" "o" "v"]}
           "<localleader>sj("
           { 1 paredit.api.move_to_parent_form_start
             2 "Jump to parent form's head"
             :repeatable false
             :mode ["n" "x" "v"]}
           "<localleader>sj)"
           { 1 paredit.api.move_to_parent_form_end
             2 "Jump to parent form's tail"
             :repeatable false
             :mode ["n" "x" "v"]}
           "<localleader>sjT"
           { 1 paredit.api.move_to_top_level_form_head
             2 "Jump to top level form's head"
             :repeatable false
             :mode ["n" "x" "v"]}

           ; These are text object selection keybindings which can used with standard `d, y, c`, `v`
           "af"
           { 1 paredit.api.select_around_form
             2 "Around form"
             :repeatable false
             :mode [ "o" "v" ] }
           "if"
           { 1 paredit.api.select_in_form
             2 "In form"
             :repeatable false
             :mode [ "o" "v" ] }
           "aF"
           { 1 paredit.api.select_around_top_level_form
             2 "Around top level form"
             :repeatable false
             :mode ["o" "v"]}
           "iF"
           { 1 paredit.api.select_in_top_level_form
             2 "In top level form"
             :repeatable false
             :mode ["o" "v"]}
           "ae" 
           { 1 paredit.api.select_element
             2 "Around element"
             :repeatable false
             :mode ["o" "v"]}
           "ie" 
           { 1 paredit.api.select_element
             2 "Element"
             :repeatable false
             :mode ["o" "v"]}}}))})

(utils.defer.add_deferred (fn []
  (when (utils.plugins.has_plugin :nvim-paredit)
    (utils.keymaps.wk_add
     [ { 1 :<localleader>s :group "ParEdit [S]exp Operations" } ])
    (utils.keymaps.wk_add
     [ { 1 "<localleader>s)" :group "Slurp/Barf Forwards [)]" } ])
    (utils.keymaps.wk_add
     [ { 1 "<localleader>s(" :group "Slurp/Barf Backwards [(]" } ])
    (utils.keymaps.wk_add
     [ { 1 "<localleader>se" :group "Drag [e]lement" } ])
    (utils.keymaps.wk_add
     [ { 1 "<localleader>sp" :group "Drag [p]air" } ])
    (utils.keymaps.wk_add
     [ { 1 "<localleader>sf" :group "Drag [f]orm" } ])
    (utils.keymaps.wk_add
     [ { 1 "<localleader>sg" :group "Jump to previous element tail" } ])
    (utils.keymaps.wk_add
     [ { 1 "<localleader>sj" :group "Jump to ___" } ])))
  :which-key)

nvim-paredit
