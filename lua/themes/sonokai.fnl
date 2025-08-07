(local vim _G.vim)
{ 1 :sainnhe/sonokai
  ; :lazy false
  :priority 1000
  :init (fn []
    (set vim.g.sonokai_style :espresso)
    (set vim.g.sonokai_enable_italic true))}
