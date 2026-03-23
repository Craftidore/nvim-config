(local utils _G.vim.g.utils)

(local use_ollama false)
(local chat-adapter (if use_ollama
                        { :name :ollama :model "qwen3:4b" }
                        { :name :copilot :model "claude-opus-4.6" }))

(if (utils.is_machmotion)
  { 1 :olimorris/codecompanion.nvim
    :version "^19.6.0"
    :dependencies [ :github/copilot.vim ] ; :nvim-treesitter/nvim-treesitter 
    :opts { :interactions
           { :chat { :adapter chat-adapter }}
           }}
    {})

