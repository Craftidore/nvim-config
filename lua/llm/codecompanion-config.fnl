(local utils _G.vim.g.utils)

(if (utils.is_machmotion)
  { 1 :olimorris/codecompanion.nvim
    :version "^19.0.0"
    :dependencies [ ] ; :nvim-treesitter/nvim-treesitter 
    :opts { :interactions
           { :chat { :adapter { :name :ollama
                                :model "gemma3:12b" }
                     :opts { :system_prompt (fn [ctx]
                                           (.. (. ctx :default_system_prompt)
                                               "Additional Context:\nKeep responses terse.\nThe user's name is Craftidore, and you should address him.\nThe user is working on a Linux system, running Fedora Atomic with Hyprland.\nThe user works for MachMotion."))}}}}}
  {})

