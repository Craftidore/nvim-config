(local vim _G.vim)
(local escape-keys (fn [keys]
                  (vim.api.nvim_replace_termcodes keys true false true)))
(local keys
  {
   :escape_keys escape-keys
   :escape (escape-keys :<Esc>)
   :cr (escape-keys :<CR>)})

keys
