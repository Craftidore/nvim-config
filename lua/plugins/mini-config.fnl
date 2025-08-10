(local g _G.vim.g)
(local mini-config 
  { 1 "echasnovski/mini.nvim"
    :config (fn []
    ; Better Around/Inside textobjects
    ;
    ; Examples:
    ;  - va)  - [V]isually select [A]round [)]paren
    ;  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    ;  - ci'  - [C]hange [I]nside [']quote
    ; require('mini.ai').setup({ n_lines = 500 })

    ; Simple and easy statusline.
    (local statusline (require "mini.statusline"))
    (statusline.setup {:use_icons g.have_nerd_font})

    ;  cursor location to LINE:COLUMN
    ; -@diagnostic disable-next-line: duplicate-set-field
    (set statusline.section_location (fn [] "%2l:%-2v"))

    ; ... and there is more!
    (local starter (require :mini.starter))
    (starter.setup
     {:content_hooks
      [(starter.gen_hook.adding_bullet)
       (starter.gen_hook.aligning :center :center)]
      ; 'Z' absent so ZZ functions porperly
      :query_updaters :abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXY0123456789_-.
      :silent true})
    (local tabline (require :mini.tabline))
    (tabline.setup
      {:show_icons true
       1 (fn [buf_id label]
         (local suffix (if (. _G.vim.bo buf_id :modified) "* " ""))
         (.. (_G.MiniTabline.default_format buf_id label) suffix))
       :tabpage_section :left})
    ; Perfect status line for my needs
    ; require('mini.files').setup() -- I like Oil better
    ((. (require :mini.notify) :setup)
      {:lsp_progress
        { :enable false } ; I like fidget better...
       :window { :winblend g.winblend }})
    (set _G.vim.notify ((. (require :mini.notify) :make_notify))))})

mini-config
