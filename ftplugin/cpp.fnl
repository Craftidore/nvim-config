(local vim _G.vim)
(local utils vim.g.utils)
(local augroup vim.api.nvim_create_augroup)
(local autocmd vim.api.nvim_create_autocmd)

(local group :crafti-cpp-filetype)
(augroup group {:clear true})

(autocmd [ :FileType ]
         { :group group
           :pattern :cpp
           :callback
           (fn []
             (when (utils.is_machmotion)
               (vim.treesitter.start)))})

