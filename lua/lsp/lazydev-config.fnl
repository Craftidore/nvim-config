(local vim _G.vim)
{ 1 :folke/lazydev.nvim
  :ft :lua
  :opts { :library [ ; Load luvit types when the `vim.uv` word is found
                    {:path "${3rd}/luv/library" :words ["vim%.uv"]}]}}

