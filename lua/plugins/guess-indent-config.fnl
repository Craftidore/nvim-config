(local guess-indent-config
   {1 :NMAC427/guess-indent.nvim
    :keys [{1 :<leader>ui
            2 :<CMD>GuessIndent<CR>
            :desc "Guess Indent"
            :mode :n}]
    :lazy false
    :opts {:auto_cmd true ; Set to false to disable automatic execution
           :override_editorconfig false ; Set to true to override settings set by .editorconfig
           :filetype_exclude [:netrw :tutor] ; A list of filetypes for which the auto command gets disabled
           :buftype_exclude [:help :nofile :terminal :prompt] ; A list of buffer types for which the auto command gets disabled
           ; A table of vim options when tabs are detected
           :on_tab_options {:expandtab false} 
           ; A table of vim options when spaces are detected
           ;  If the option value is 'detected', The value is set to the automatically detected indent size.
           :on_space_options {:expandtab true
                              :shiftwidth :detected
                              :softtabstop :detected
                              :tabstop :detected}}})

guess-indent-config	

