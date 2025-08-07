(local vim _G.vim)
(local utils vim.g.utils)
(local g vim.g)
(local noremap utils.keymaps.noremap)
(local telescope-config
  { 1 :nvim-telescope/telescope.nvim
    :event :VimEnter
    :dependencies
    [ :nvim-lua/plenary.nvim
      { 1 :nvim-telescope/telescope-fzf-native.nvim
        :build :make
        :cond (fn [] (= (vim.fn.executable :make) 1))}
      [ :albenisolmos/telescope-oil.nvim ]
      [ :nvim-telescope/telescope-ui-select.nvim ]
      { 1 :nvim-tree/nvim-web-devicons :enabled g.have_nerd_font }]

    :config 
    (fn []
      ((. (require :telescope) :setup)
        { :extensions [ :ui-select [ ((. (require :telescope.themes) :get_dropdown)) ]
                        :oil { :hidden false ; Otherwise it includes .git folders
                               :debug false
                               :no_ignore false
                               :show_preview true}]})
      (local themes (require :telescope.themes))
      (local dropdown themes.get_dropdown)
      (local get_cursor themes.get_cursor)
      ; Enable Telescope extensions if they are installed
      (pcall (. (require :telescope) :load_extension) :fzf)
      (pcall (. (require :telescope) :load_extension) :ui-select)
      (fn oil-directories [] ((. (require :telescope) :extensions :oil :oil)))

      (fn default-theme [additional-opts]
        (local opts { :winblend g.winblend } )
        (if (~= additional-opts nil)
          (each [k v (pairs additional-opts)]
            (tset opts k v)))
        opts)
      (fn buf-theme [additional-opts]
        (local opts
          { :winblend g.winblend
            :previewer false })
        (if (~= additional-opts nil)
          (each [k v (pairs additional-opts)]
            (tset opts k v)))
        (dropdown opts))
      (fn file-theme [additional-opts]
        (local opts
          { :winblend vim.g.winblend
            :previewer true })
        (if (~= additional-opts nil)
          (each [k v (pairs additional-opts)]
            (tset opts k v)))
        (dropdown opts))
      (fn themed [picker theme theme-opts]
        (if (= theme nil)
          (fn [] (picker (default-theme theme-opts)))
          (fn [] (picker (theme theme-opts)))))
      (local builtin (require :telescope.builtin))
      (noremap :n :<leader>th (themed builtin.help_tags buf-theme) "Telescope search [H]elp")
      (noremap :n :<leader>tk (themed builtin.keymaps default-theme) "Telescope search [K]eymaps")
      (noremap :n :<leader>tf (themed builtin.find_files file-theme) "Telescope search [F]iles")
      (noremap :n :<leader>to oil-directories "Telescope open dir in [o]il")
      (noremap :n :<leader>tt (themed builtin.builtin file-theme) "Telescope search select [t]elescope")
  
      (noremap :n :<leader>tc
               (fn [] ((themed builtin.colorscheme
                         file-theme
                         { :enable_preview true :ignore_builtins true })))
               "Telescope search [c]olorscheme")
  
      (noremap :n :<leader>te (themed builtin.commands file-theme {}) "Telescope [e]xecute Command")
  
      (noremap :n :<leader>tw
               (themed builtin.grep_string file-theme { :enable_preview true })
               "Telescope search current [W]ord")
  
      (noremap :n :<leader>tg
               (themed builtin.live_grep buf-theme { :enable_preview true })
               "Telescope search by [G]rep")
      (noremap :n :<leader>td
               (themed builtin.diagnostics file-theme)
               "Telescope search [D]iagnostics")
  
      (noremap :n :<leader>tr builtin.resume "Telescope search [R]esume")
      (noremap :n "<leader>t." (themed builtin.oldfiles file-theme) "Telescope search Recent Files (\".\" for repeat)")
  
      (noremap :n :<leader>tb (themed builtin.buffers default-theme) "Telescope search existing [B]uffers")
  
      (noremap :n :<leader>t/ (themed builtin.current_buffer_fuzzy_find buf-theme)
        "Telescope Fuzzily search [/] in current buffer")
  
      ; noremap( 'n', '<leader>tg/', themed(builtin.live_grep, default_theme, { grep_open_files = true, prompt_title = 'Live Grep', }), 'Telescope search [/] open files')
      ;
      (noremap :n :<leader>tn (themed builtin.find_files file-theme { :cwd (vim.fn.stdpath :config) })
        "Telescope search [N]eovim config")) ; NOTE: end of :config
    })

(utils.defer.add_deferred
  (fn []
    (when (utils.plugins.has_plugin :telescope)
    (utils.keymaps.wk_add
      [{1 :<leader>t :group "[T]elescope"}])))
  :which-key)

telescope-config
