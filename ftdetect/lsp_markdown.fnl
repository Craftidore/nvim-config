(local vim _G.vim)
; Normal 'markdown' filetype doesn't highlight `code` right
; NOTE: Update: Fixed code highlighting with render_markdown plugin
; (vim.filetype.add
;   ; NOTE: Seems like the default priority for user filetype is lower than 'markdown'
;   { :extension { :md :lsp_markdown } })

