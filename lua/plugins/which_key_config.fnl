(local vim _G.vim)
(local g vim.g)
(local utils g.utils)

{ 1 :folke/which-key.nvim
  :event :VeryLazy
  :opts { :preset :helix ; display in bottom-right corner
          ; delay between pressing a key and opening which-key (milliseconds)
          ; this setting is independent of vim.o.timeoutlen
          :delay 0
          :icons { :mappings g.have_nerd_font
                   :keys (if g.have_nerd_font {}
                           {:Up "<Up> "
                            :Down "<Down> "
                            :Left "<Left> "
                            :Right "<Right> "
                            :C "<C-…> "
                            :M "<M-…> "
                            :D "<D-…> "
                            :S "<S-…> "
                            :CR "<CR> "
                            :Esc "<Esc> "
                            :ScrollWheelDown "<ScrollWheelDown> "
                            :ScrollWheelUp "<ScrollWheelUp> "
                            :NL "<NL> "
                            :BS "<BS> "
                            :Space "<Space> "
                            :Tab "<Tab> "
                            :F1 "<F1>"
                            :F2 "<F2>"
                            :F3 "<F3>"
                            :F4 "<F4>"
                            :F5 "<F5>"
                            :F6 "<F6>"
                            :F7 "<F7>"
                            :F8 "<F8>"
                            :F9 "<F9>"
                            :F10 "<F10>"
                            :F11 "<F11>"
                            :F12 "<F12>" })}
          :triggers [
            { 1 :<auto> :mode :nixsotc }
            ; For vim's built-in 'dumb' completion
            { 1 :<C-x> :mode :nixsotc }]
          :plugins { ;default unless marked by empty comment
            :marks true
            :registers true
            :spelling { :enabled true
                        :suggestions 10} ;
            :presets { :operators false ;
                       :motions false ;
                       :text_objects true
                       :windows true
                       :nav true
                       :z true
                       :g true}}

          ; Document existing key chains
          :spec [
            ; Formerly plugin/custom namespaces were here, but now they live in
            ; plugin_config -> utils.defer -> 'which-key'
            ; keymaps -> utils.defer -> 'which-key' for non-plugin namespaces
            ; Built-in mappings that I'd like to show up are still located here

            ; NOTE: ZZ because my custom 'ZF' and 'ZQ' is there and it feels weird not seeing all of them
            { 1 :ZZ :mode :n :desc "Save and Quit (:wq)" }

            ; NOTE: Vim's built-in 'dumb' completion
            { 1 :<C-x><C-l>  :mode :i :desc "Complete whole [l]ines" }
            { 1 :<C-x><C-n>  :mode :i :desc "Complete [n] keywords in current file" }
            { 1 :<C-x><C-k>  :mode :i :desc "Complete [k] words from a dictionary" }
            { 1 :<C-x><C-t>  :mode :i :desc "Complete words from a [t]hesaurus" }
            { 1 :<C-x><C-i>  :mode :i :desc "Complete current and [i]ncluded files" }
            { 1 "<C-x><C-]>" :mode :i :desc "Complete tags []]" }
            { 1 :<C-x><C-f>  :mode :i :desc "Complete [f]ile names" }
            { 1 :<C-x><C-d>  :mode :i :desc "Complete [d]efinitions or macro (also in included files)" }
            { 1 :<C-x><C-v>  :mode :i :desc "Complete [v]im command line" }
            { 1 :<C-x><C-u>  :mode :i :desc "Complete [u]ser defined completion" }
            { 1 :<C-x><C-o>  :mode :i :desc "Complete [o]mni (intelligent) completion" }
            { 1 :<C-x><C-z>  :mode :i :desc "Complete nothing; cancel" }]
          :win { :wo { :winblend g.winblend }}}
  :config (fn [opts]
    ((. (require :which-key) :setup) opts.opts)
    (utils.defer.run :which-key))}
