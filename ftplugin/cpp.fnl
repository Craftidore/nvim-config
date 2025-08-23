(local vim _G.vim)
(local utils vim.g.utils)

(when (utils.is_machmotion)
  (vim.treesitter.start))

