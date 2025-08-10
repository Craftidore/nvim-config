(local vim _G.vim)
(local utils vim.g.utils)
(local blink-config 
  { ; Autocompletion
    1 :saghen/blink.cmp
    :event :VimEnter
    :tag :v1.3.1
    :dependencies
    [ ; Snippet Engine
      { 1 :L3MON4D3/LuaSnip
        :version :2.*
        :build (if 
          ; Build Step is needed for regex support in snippets.
          ; This step is not supported in many windows environments.
          ; Remove the below condition to re-enable on windows.
          (not (or (= (vim.fn.has :win32) 1) (= (vim.fn.executable :make) 0)))
            "make install_jsregexp"
            nil)
        :dependencies
        [ { 1 :rafamadriz/friendly-snippets
            :config (fn []
              ((. (require :luasnip.loaders.from_vscode) :lazy_load))
              ((. (require :luasnip.loaders.from_vscode) :lazy_load)
               {:paths [(.. (vim.fn.stdpath :config) :/snippets/)]}))}]
        :opts {}}
      { 1 :saghen/blink.compat
        ; use v2.* for blink.cmp v1.*
        :version :2.*
        ; lazy.nvim will automatically load the plugin when it's required by blink.cmp
        :lazy true
        ; make sure to set opts so that lazy.nvim calls blink.compat's setup
        :opts {}}
      :folke/lazydev.nvim]
    ; @module 'blink.cmp'
    ; @type blink.cmp.Config
    :opts
    { :keymap
     {  ; 'default' (recommended) for mappings similar to built-in completions
        ;   <c-y> to accept ([y]es) the completion.
        ; 'super-tab' for tab to accept
        ; 'enter' for enter to accept
        ; 'none' for no mappings
        ;
        ; For an understanding of why the 'default' preset is recommended,
        ; you will need to read `:help ins-completion`
        ;
        ; All presets have the following mappings:
        ; <tab>/<s-tab>: move to right/left of your snippet expansion
        ; <c-space>: Open menu or open docs if already open
        ; <c-n>/<c-p> or <up>/<down>: Select next/previous item
        ; <c-e>: Hide menu
        ; <c-k>: Toggle signature help
        ;
        ; See :h blink-cmp-config-keymap for defining your own keymap
        :preset :none
        ; Refused to map to <C-x><C-s>
        ; (i_CTRL-s is ordinarily show-signature)
        :<C-s> [(fn [cmp] (cmp.show {:providers [:snippets]}))]
        :<C-e> [:hide]
        :<C-y> [:select_and_accept]
        :<C-p> [:select_prev :fallback_to_mappings]
        :<C-n> [:select_next :fallback_to_mappings]
        :<C-j> [:snippet_forward :fallback]
        :<C-k> [:snippet_backward :fallback]
        :<C-l> [:show_signature :hide_signature :fallback]}}
  
      :appearance 
      { ; 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        ; Adjusts spacing to ensure icons are aligned
        :nerd_font_variant :mono }
  
      :completion
      { ; By default, you may press `<c-space>` to show the documentation.
        ; Optionally, set `auto_show = true` to show the documentation after a delay.
        :documentation {:auto_show false :auto_show_delay_ms 500}}
  
      :sources
      {:default {:lsp :path :lazydev :buffer}
        :providers {
          :snippets {
            :should_show_items (fn [ctx]
              (~= ctx.trigger.initial_kind :trigger_character))}
          :lazydev { :module :lazydev.integrations.blink :score_offset 100}}
        :transform_items (fn [_ items] items)}
  
      :snippets { :preset :luasnip }
  
      ; Blink.cmp includes an optional, recommended rust fuzzy matcher,
      ; which automatically downloads a prebuilt binary when enabled.
      ;
      ; By default, we use the Lua implementation instead, but you may enable
      ; the rust implementation via `'prefer_rust_with_warning'`
      ;
      ; See :h blink-cmp-config-fuzzy for more information
      :fuzzy {:implementation :lua}
  
      ; Shows a signature help window while you type arguments for a function
      :signature {:enabled true}})
blink-config
