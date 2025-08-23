(local vim _G.vim)
(local g vim.g)
(local api vim.api)

(when (~= g.text_width nil)
 (api.nvim_set_option_value
   :textwidth g.text_width {:scope :local}))

