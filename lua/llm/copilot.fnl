(local vim _G.vim)
(local utils vim.g.utils)

(if (utils.is_machmotion)
  { 1 :github/copilot.vim
      :config (fn [plugin opts]
                (vim.cmd "Copilot disable")) }
  {})
