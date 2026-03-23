(local vim _G.vim)

{ 1 :github/copilot.vim
    :config (fn [plugin opts]
              (vim.cmd "Copilot disable")) }
