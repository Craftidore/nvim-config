(local buffer-manager-config
  { 1 "j-morano/buffer_manager.nvim"
    :dependencies [:nvim-lua/plenary.nvim]
    :opts {:line_keys "1234567890"
           :select_menu_item_commands 
            {:edit {:key :<CR> :command :edit}}
           :focus_alternate_buffer false
           :width nil
           :height nil
           :short_file_names false
           :show_depth true
           :short_term_names false
           :loop_nav true
           :highlight ""
           :win_extra_options {}
           :borderchars [ "─" "│" "─" "│" "╭" "╮" "╯" "╰" ]
           :format_function nil
           :order_buffers nil
           :show_indicators nil
           :toggle_key_bindings ["q" "<ESC>"]}
    :keys [
           {1 :<leader>ob
            2 (fn [] ((. (require :buffer_manager.ui) :toggle_quick_menu)))
            :mode :n
            :desc "Open [b]uffer Manager"}]})

buffer-manager-config
