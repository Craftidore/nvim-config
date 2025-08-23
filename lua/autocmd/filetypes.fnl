(local vim _G.vim)
(local api vim.api)
(local utils vim.g.utils)

(local group :crafti-filetype)

(api.nvim_create_augroup group { :clear true })

(api.nvim_create_autocmd
  [ :LspAttach ]
  { :pattern [ :*.cpp :*.hpp :*.h :*.c ]
    :group group
    :desc "Default-disable C++ LSP if in MachMotion env"
    :callback 
    (fn []
      (when (and (utils.is_machmotion)
                 ; For use with ../commands/machmotion-commands.fnl
                 ; Don't want to deal with Lua falsy values, so ~= true
                 (~= vim.b.allow_cpp_lsp true)
                 (~= vim.g.allow_cpp_lsp true))
        (vim.cmd :LspStop)
        (vim.notify "C++ Lsp disabled" vim.log.levels.INFO))
      nil)})

( api.nvim_create_autocmd
  [ :BufEnter :BufCreate ]
  { :pattern [ :*.tex ]
    :group group
    :desc "Default-add comment wrap/continue for TeX buffer"
    :callback 
    (fn []
      (set vim.bo.formatoptions (.. vim.bo.formatoptions :cro))
      nil)})
