(local vim _G.vim)
(local utils vim.g.utils)

(local noremap utils.keymaps.noremap)

; Much of this is adapted from kickstart.nvim
(local lazypath (.. (vim.fn.stdpath :data) :/lazy/lazy.nvim))
(when (not ((. (or vim.uv vim.loop) :fs_stat) lazypath))
  (local lazyrepo :https://github.com/folke/lazy.nvim.git)
  (local out (vim.fn.system ["git" "clone" "--filter=blob:none" "--branch=stable" lazyrepo lazypath]))
  (when (~= vim.v.shell_error 0)
    (error (.. "Error cloning lazy.nvim:\n" out))))

; @type vim.Option
(local rtp vim.opt.rtp)
(rtp:prepend lazypath)

(local lazyUiConfig {
  ; If you are using a Nerd Font: set icons to an empty table which will use the
  ; default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
  :icons (if vim.g.have_nerd_font {}
           { :cmd "⌘"
             :config "🛠"
             :event "📅"
             :ft "📂"
             :init "⚙"
             :keys "🗝"
             :plugin "🔌"
             :runtime "💻"
             :require "🌙"
             :source "📄"
             :start "🚀"
             :task "📌"
             :lazy "💤 "})})

((. (require :lazy) :setup)
 { :spec [{:import "themes"}
          {:import "plugins"}
          {:import "lsp"}
          {:import "treesitter"}]
   :ui lazyUiConfig})

(noremap :n :<leader>ol :<CMD>Lazy<CR> "Open [l]azy")

(utils.defer.run :lazy)

