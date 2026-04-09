(local vim _G.vim)
(local utils _G.vim.g.utils)

(local use_ollama false)
(local chat-adapter (if use_ollama
                        { :name :ollama :model "qwen3:4b" }
                        { :name :copilot :model "claude-opus-4.6" }))

(if (utils.is_machmotion)
  (do
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

    { 1 :olimorris/codecompanion.nvim
      :version "^19.6.0"
      :dependencies [ :github/copilot.vim ] ; :nvim-treesitter/nvim-treesitter 
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
                                      :tools { :run_command { :opts { :allowed_in_yolo_mode true } } 
                                               :opts { :default_tools [ :agent ] }}
                                      :opts { :prompt_decorator (fn [message adapter context]
                                                                  (string.format "<prompt>%s</prompt>" message)) }
                                    }
                              ; :inline { :adapter { :name :ollama :model "" } }
                            }
            }
      :keys [
             { 1 :<leader>oa 2 "<CMD>CodeCompanionChat<CR>" :mode :n :desc "Open CodeCompanion Chat" }
             ; { 1 :<leader>oa 2 "<CMD>CodeCompanionActions<CR>" :mode :n :desc "Open CodeCompanion Chat" }
             ]
      })

  {})

