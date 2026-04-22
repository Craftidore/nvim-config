(local vim _G.vim)
(local utils _G.vim.g.utils)

(local prompt-source-dir (.. (vim.fn.stdpath :config) :/prompts/source))

(local use_ollama false)
(local ollama-adapter { :name :ollama :model "qwen3:4b" })
(local ollama-noreason-adapter { :name :ollama :model "llama3.2:3b" })
(local chat-adapter (if use_ollama
                        ollama-adapter
                        { :name :copilot :model "claude-sonnet-4.6" }))

(local extra-system-prompt (do
                             (local extra-system-prompt-path (.. prompt-source-dir :/extra-system-prompt.md))
                             (local f (assert (io.open extra-system-prompt-path :r)))
                             (local t (: f :read :*all))
                             (: f :close)
                             t))
(local update-system-prompt (fn [ctx]
                              (.. ctx.default_system_prompt
                                  extra-system-prompt)))

(if (utils.is_machmotion)
  (do
    (utils.defer.add_deferred (fn []
      (when (utils.plugins.has_plugin :codecompanion)
        (utils.keymaps.wk_add
         [ { 1 :gc :group "CodeCompanion (+ Comments)" } ])))
      :which-key)

    (vim.api.nvim_create_autocmd
      "User"
      { :pattern "CodeCompanionChatCreated"
        :callback (fn [args]
                    (local chat ((. (require :codecompanion) :buf_get_chat) args.data.bufnr))
                    (: chat :add_callback "on_tool_output" (fn [c data]
                      (local tokens (require :codecompanion.utils.tokens))
                      (local max_tokens 12000)

                      (when (and data.for_llm (> (tokens.calculate data.for_llm) max_tokens))
                        ; Trim to roughly max_tokens worth of characters
                        (local max_chars (* max_tokens 6))
                        (tset data :for_llm (.. (: data.for_llm :sub 1 max_chars) "\n\n[Output truncated]"))
                        (tset data :for_user data.for_llm)
                        (vim.notify
                          (string.format "Tool output from '%s' truncated (~%d tokens)" data.tool max_tokens)
                          vim.log.levels.WARN)))))
        })
    (vim.api.nvim_create_autocmd
      "User"
      { :pattern "CodeCompanionChatCreated"
        :callback (fn [args]
                    (local chat ((. (require :codecompanion) :buf_get_chat) args.data.bufnr))
                    (: chat :add_callback "on_checkpoint" (fn [c data]
                      (local context_window (and data.adapter.meta data.adapter.meta.context_window))
                      (when context_window
                        (local usage (/ data.estimated_tokens context_window))
                        (when (> usage 0.8)
                          (vim.notify
                            (string.format "Context window %.0f%% full" (* usage 100))
                            vim.log.levels.WARN))))))
        })
    (vim.api.nvim_create_autocmd
      "User"
      { :pattern "CodeCompanionChatCreated"
        :callback (fn [args]
                    (local chat ((. (require :codecompanion) :buf_get_chat) args.data.bufnr))
                    (: chat :add_callback "on_ready"
                       (fn [c data]
                         (vim.notify
                           "LLM returned a response."
                           vim.log.levels.INFO)
                         (vim.cmd "!notify-send 'LLM returned a response'")
                         )
                       ))
        })

    (local agent-group-cfg
      { :description "Agent - Can run code, edit code and modify files on your behalf"
        :system_prompt (fn [group ctx]
            (.. ((. (require :codecompanion.config) :config :interactions :chat :tools :groups :agent :system_prompt) nil ctx)
                extra-system-prompt))
            :tools [ :ask_questions :create_file :delete_file :file_search :get_changed_files :get_diagnostics :grep_search :insert_edit_into_file :read_file :run_command ]
            :opts { :collapse_tools true
                    :ignore_system_prompt true
                    :ignore_tool_system_prompt true } })

    { 1 :olimorris/codecompanion.nvim
      :version "^19.6.0"
      :dependencies [:github/copilot.vim 
                     :ravitemer/codecompanion-history.nvim] ; :nvim-treesitter/nvim-treesitter 
      :opts { :rules { :machmotion_rules
                       { :description "Rules related to machmotion details involving my specific machine"
                         :files [ { :path "/run/media/craftidore/AltDrive/mach/rules/" 
                                    :files "*.md" } ] }
                       :copilot_rules
                       { :description "copilot rules, used by the rest of the company" 
                        :files [ ".github/copilot-instructions.md" ] }
                       :opts
                       { :chat { :autoload [ :copilot_rules :machmotion_rules ] } } }
              :interactions { :chat { :adapter chat-adapter 
                                      :tools { :run_command { :opts {; I'd like to formally acknowledge that I hate this and it's a malware vector, but it's what my boss wants, and it's on him when malware inevitably happens.
                                                                     :allowed_in_yolo_mode true } }
                                               ;; Prefer memory mcp server, with persistent config
                                               ; :memory { :opts { :whitelist
                                               ;                  [ { :path (.. (vim.fn.stdpath :data) :/llm-memory) :as :memories } ]}}
                                               :groups { :prompted-agent agent-group-cfg }
                                               :opts { :default_tools [ :prompted-agent ] }}
                                      :opts { :prompt_decorator (fn [message adapter context]
                                                                  (string.format "<prompt>%s</prompt>" message)) 
                                              :system_prompt update-system-prompt }
                                      :keymaps { :options { :modes { :n "g?" }; Default is "?", but I like being able to backwards search
                                                            :callback :keymaps.options
                                                            :description :Options
                                                            :hide true }
                                                }
                                    }
                              :inline { :adapter ollama-adapter }
                            }
              :adapters {}
              :mcp { :servers { :sequental-thinking
                                { :cmd [:npx :-y "@modelcontextprotocol/server-sequential-thinking"]}
                                :server-memory
                                { :cmd [:npx :-y "@modelcontextprotocol/server-memory"]
                                  :env { :MEMORY_FILE_PATH (.. (vim.fn.stdpath :data) :/llm-memory.jsonl) }}
                                :calc-mcp
                                { :cmd [:npx :--prefix :/tmp :-y "@coo-quack/calc-mcp@latest"]}
                                :chrome-devtools
                                { :cmd [:npx :-y "chrome-devtools-mcp@latest" :--browser-url=http://127.0.0.1:9222 :--no-usage-statistics :--redact-network-headers]
                                  :env { :CHROME_DEVTOOLS_MCP_NO_USAGE_STATISTICS "true" }} }
                     :opts { :default_servers [ :sequental-thinking :calc-mcp :server-memory ]} }
              ; WARN: This requires `:TSInstall yaml`
              :prompt_library { :markdown { :dirs
                                           [ (.. (vim.fn.stdpath :config ) "/prompts/actions")
                                             (.. (. (vim.fn.environ) :HOME) "/.prompts")
                                             (.. (vim.fn.getcwd) "/.craftidore.prompts") ]}}
              :display { :action_palette { :opts { 
                                                  :show_preset_prompts false
                                                  } }}
              :extensions
              {:history {:enabled false
                         :opts {:keymap "<leader>gah"
                                :save_chat_keymap "<leader>gass"
                                :auto_save true
                                :expiration_days 7
                                :auto_generate_title true
                                :title_generation_opts { :adapter (. ollama-noreason-adapter :name)
                                                         :model (. ollama-noreason-adapter :model)
                                                         :refresh_every_n_prompts 3 }
                                :summary {:create_summary_keymap "<leader>gasc"
                                          :browse_summaries_keymap "<leader>gasv"
                                          :generation_opts
                                          { :adapter (. ollama-noreason-adapter :name)
                                            :model (. ollama-noreason-adapter :model)
                                            :context_size 12000
                                            :include_references false
                                            :include_tool_outputs false } }
                                :memory { :auto_create_memories_on_summary_generation false ; Don't have deps installed
                                          :vectorcode_exe "echo" } } }
              }
            }
      :keys [; { 1 :<leader>oa 2 "<CMD>CodeCompanionActions<CR>" :mode :n :desc "Open CodeCompanion Chat" }
             { 1 :<leader>gat 2 "<CMD>CodeCompanionChat Toggle<CR>" :mode [:n :v] :desc "Toggle CodeCompanion Chat" }
             { 1 :<leader>gaa 2 "<CMD>CodeCompanionChat<CR>" :mode [:n :v] :desc "Open CodeCompanion Chat" }
             { 1 :<leader>gae 2 "<CMD>CodeCompanionActions<CR>" :mode [:n :v] :desc "CodeCompanion Actions" }
             { 1 :<leader>gan 2 "<CMD>CodeCompanionChat Add<CR>" :mode :v :desc "Add to CodeCompanion Chat" }
             { 1 :<leader>gai 2 "<CMD>CodeCompanion<CR>" :mode :v :desc "CodeCompanion Inline" } ]
      })

  {})

