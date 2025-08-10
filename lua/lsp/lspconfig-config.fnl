(local vim _G.vim)
(local utils vim.g.utils)
; Shamelessly lifted from kickstart.nvim with minimal changes...
; (except the conversion to fennel)
(local lsp-config
  { ; Main LSP Configuration
    1 :neovim/nvim-lspconfig
    :dependencies [ ; Mason must be loaded before its dependents so we need to set it up here.
                    { 1 :mason-org/mason.nvim
                      :tag :v2.0.0
                      :opts {}
                      :keys [{ 1 :<leader>om 2 :<CMD>Mason<CR> :mode :n :desc "Open [m]ason" }]}
                    :mason-org/mason-lspconfig.nvim
                    :WhoIsSethDaniel/mason-tool-installer.nvim
                    ; Useful status updates for LSP.
                    { 1 :j-hui/fidget.nvim :opts {} }

                    ; Allows extra capabilities provided by blink.cmp
                    :saghen/blink.cmp]
    :config (fn []
      (vim.api.nvim_create_autocmd
        :LspAttach
        { :group (vim.api.nvim_create_augroup :kickstart-lsp-attach { :clear true })
          :callback
          (fn [event]
            (local map (fn [keys func desc ?mode]
              (local mode (if (= ?mode nil) :n ?mode))
              (vim.keymap.set mode keys func { :buffer event.buf :desc desc })))

            (local popup-opts { :border :rounded })

            ; Rename variable
            (map :<leader>lr vim.lsp.buf.rename "LSP: [r]ename")

            ; Execute a code action, usually fixing errors
            (map :<leader>la vim.lsp.buf.code_action "LSP: Code [a]ction" { :n :x })

            ; Find references
            (map :<leader>lf (. (require :telescope.builtin) :lsp_references) "LSP: Goto Re[f]erences")

            ; Jump to the implementation
            (map :<leader>li (. (require :telescope.builtin) :lsp_implementations) "LSP: Goto [i]mplementation")

            ; Jump to the definition
            ;  To jump back, press <C-t>.
            (map :<leader>ltd (. (require :telescope.builtin) :lsp_definitions) "LSP: Telescope [d]efinitions")

            ; Goto declaration (like c header file)
            (map :<leader>ld vim.lsp.buf.declaration "LSP: Goto [d]eclaration")

            ; Fuzzy find symbols in current document.
            (map :<leader>ltb (. (require :telescope.builtin) :lsp_document_symbols) "LSP: Telescope [b]uffer Symbols")

            ; Fuzzy find all symbols in workspace.
            (map
              :<leader>ltw
              (. (require :telescope.builtin) :lsp_dynamic_workspace_symbols)
              "LSP: Telescope [w]orkspace Symbols")

            ; Jump to type
            (map :<leader>ltt (. (require :telescope.builtin) :lsp_type_definitions) "LSP: Telescope [t]ype Definitions")

            (map :<leader>ls (fn [] (vim.lsp.buf.hover popup-opts)) "LSP: Hover detail[s]")

            ; This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
            ; @param client vim.lsp.Client
            ; @param method vim.lsp.protocol.Method
            ; @param bufnr? integer some lsp support methods only in specific files
            ; @return boolean
            (fn client_supports_method [client method bufnr]
              (if (= (vim.fn.has :nvim-0.11) 1)
                (: client :supports_method method bufnr)
                (client.supports_method method { :bufnr bufnr })))

            ; The following two autocommands are used to highlight references of the
            ; word under your cursor when your cursor rests there for a little while.
            ;    See `:help CursorHold` for information about when this is executed
            ;
            ; When you move your cursor, the highlights will be cleared (the second autocommand).
            (local client (vim.lsp.get_client_by_id event.data.client_id))
            (when (and client (client_supports_method client vim.lsp.protocol.Methods.textDocument_documentHighlight event.buf))
              (local highlight_augroup (vim.api.nvim_create_augroup :kickstart-lsp-highlight { :clear false }))
              (vim.api.nvim_create_autocmd [:CursorHold :CursorHoldI]
                                           {:buffer event.buf
                                            :group highlight_augroup
                                            :callback vim.lsp.buf.document_highlight})
              (vim.api.nvim_create_autocmd [:CursorMoved :CursorMovedI]
                                           {:buffer event.buf
                                            :group highlight_augroup
                                            :callback vim.lsp.buf.clear_references})

              (vim.api.nvim_create_autocmd :LspDetach
                                           {:group (vim.api.nvim_create_augroup :kickstart-lsp-detach { :clear true })
                                            :callback (fn [event2] 
                                                        (vim.lsp.buf.clear_references)
                                                        (vim.api.nvim_clear_autocmds
                                                          {:group :kickstart-lsp-highlight :buffer event2.buf}))}))
            (when (and client (client_supports_method client vim.lsp.protocol.Methods.textDocument_inlayHint event.buf))
              (map :<leader>lh (fn []
                (vim.lsp.inlay_hint.enable (not (vim.lsp.inlay_hint.is_enabled { :bufnr event.buf }))))
                "LSP: Toggle Inlay [h]ints")))})

    ; Diagnostic Config
    ; See :help vim.diagnostic.Opts
    (vim.diagnostic.config
      { :severity_sort true
        :float { :border :rounded :source :if_many }
        :underline { :severity vim.diagnostic.severity.ERROR }
        :signs (if vim.g.have_nerd_font
                    { :text { vim.diagnostic.severity.ERROR "󰅚 "
                              vim.diagnostic.severity.WARN "󰀪 "
                              vim.diagnostic.severity.INFO "󰋽 "
                              vim.diagnostic.severity.HINT "󰌶 "}} 
                    {})
        :virtual_text 
        { :source :if_many
          :spacing 2
          :format (fn [diagnostic]
            (local diagnostic_message
              { vim.diagnostic.severity.ERROR diagnostic.message
                vim.diagnostic.severity.WARN diagnostic.message
                vim.diagnostic.severity.INFO diagnostic.message
                vim.diagnostic.severity.HINT diagnostic.message})
            (. diagnostic_message diagnostic.severity))}})

    ; LSP servers and clients are able to communicate to each other what features they support.
    ;  By default, Neovim doesn't support everything that is in the LSP specification.
    ;  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
    ;  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
    (local capabilities ((. (require :blink.cmp) :get_lsp_capabilities)))

    ; Enable the following language servers
    ; Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    ;  
    ;  Add any additional override configuration in the following tables. Available keys are:
    ;  - cmd (table): Override the default command used to start the server
    ;  - filetypes (table): Override the default list of associated filetypes for the server
    ;  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
    ;  - settings (table): Override the default settings passed when initializing the server.
    ;        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
    (local servers
      { :clangd { :cmd [:clangd ]
                  :capabilities capabilities
                  :init_options { :fallbackFlags [ :-std=c++20 ] }
                  ; :settings {}
                  :filetypes [ :h :hpp :c :cpp ]}
        :lua_ls { ; :cmd { ... }
                  ; :filetypes { ... }
                  ; :capabilities {}
                  :settings
                  { :Lua
                   { :completion { :callSnippet :Replace } }
                      ; You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                    :diagnostics { :disable [ :missing-fields]}}}})

    ; Ensure the servers and tools above are installed
    ;
    ; To check the current status of installed tools and/or manually install
    ; other tools, you can run
    ;    :Mason
    ;
    ; You can press `g?` for help in this menu.
    ;
    ; `mason` had to be setup earlier: to configure its options see the
    ; `dependencies` table for `nvim-lspconfig` above.
    ;
    ; You can add other tools here that you want Mason to install
    ; for you, so that they are available from within Neovim.
    (local ensure-installed (vim.tbl_keys (if (~= servers nil) servers {})))
    (vim.list_extend
      ensure-installed
      [ :stylua ; Used to format Lua code
        :cpplint
        :typos
        :editorconfig-checker ])
    ((. (require :mason-tool-installer) :setup) { :ensure_installed ensure-installed })

    ((. (require :mason-lspconfig) :setup)
     { :automatic_enable true
       :ensure_installed {}  ; explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
       :automatic_installation false
       :handlers
       [ (fn [server-name]
          (local server (if (~= (. servers server-name) nil) (. servers server-name) {}))
          ; This handles overriding only values explicitly passed
          ; by the server configuration above. Useful when disabling
          ; certain features of an LSP (for example, turning off formatting for ts_ls)
          (tset server :capabilities (vim.tbl_deep_extend :force {} capabilities (if (~= server.capabilities nil) server.capabilities {})))
          ((. (require :lspconfig) server-name :setup) server))]}))})

(utils.defer.add_deferred 
  (fn []
    (when (utils.plugins.has_plugin :lsp-config)
      (utils.keymaps.wk_add [{ 1 :<leader>l :group "[L]SP"}])
      (when (utils.plugins.has_plugin :telescope)
        (utils.keymaps.wk_add [{ 1 :<leader>lt :group "LSP-[t]elescope"}]))))
  :which-key)

lsp-config
