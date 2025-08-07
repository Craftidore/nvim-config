(local vim _G.vim)
(fn lint_ignore [ft]
  (local ignored-filetypes 
    [ :help
      :ministarter
      :TelescopePrompt
      :mason
      :lazy ])
  (local contains vim.g.utils.lua.contains)
  (local bad-ft (contains ignored-filetypes ft))
  bad-ft)

{ 1 :mfussenegger/nvim-lint
  :cond false
  :lazy false
  :config (fn []
    (local lint (require :lint))
    (tset lint :linters_by_ft { :cpp [ :cpplint ] })
    ; TODO: Add looping utils.ifilter to not try and call missing linters
    )
  :init (fn []
    (vim.api.nvim_create_autocmd
      [ :BufEnter :BufWritePost ]
      { :callback (fn [ev]
          (local filetype (vim.api.nvim_get_option_value :filetype { :buf ev.buf }))
          (when (not (lint_ignore filetype))
            ; NOTE: xpcall didn't work to catch lint errors because of async...
            (local lint (require :lint))
            ; Let this fail silently, since linters may not be installed yet
            ; try_lint without arguments runs the linters defined in `linters_by_ft`
            ; for the current filetype
            (lint.try_lint)
            ; TODO: Don't try and call missing linters
            (lint.try_lint :typos)
            (when (~= vim.b.editorconfig nil)
                (lint.try_lint :editorconfig-checker))))}))}

