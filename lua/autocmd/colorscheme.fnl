(local augroup _G.vim.api.nvim_create_augroup)
(local autocmd _G.vim.api.nvim_create_autocmd)

(local group :colorscheme)
(fn colors-name [] _G.vim.g.colors_name)
(fn run-cmd [command] (_G.vim.cmd command))

(augroup group { :clear true })

; NOTE: This used to fix an issue with colors carrying over between colorschemes,
;       but that's not happening now, so its disabled.

(autocmd [ :ColorschemePre ]
         { :group group
           :callback
           (fn [ev]
            (when (or (= (colors-name) :sonokai)
                      (string.find ev.match :kanagawa))
                (run-cmd "highlight clear"))
            nil)})

(autocmd [ :Colorscheme ]
        { :group group
          :callback
          (fn [ev]
            (when (or (= ev.match :minicyan) (= ev.match :minischeme))
              (local nvim_get_hl _G.vim.api.nvim_get_hl)
              (local nvim_set_hl _G.vim.api.nvim_set_hl)
              (local cline_hl (nvim_get_hl 0 { :name :CursorLine :create false}))
              (nvim_set_hl 0 :CursorLineSign {:ctermbg cline_hl.ctermbg :bg cline_hl.bg }))
            nil)})

(autocmd [ :Colorscheme ]
         { :group group
           :callback 
           (fn [ev]
             (local nvim_set_hl _G.vim.api.nvim_set_hl)
             (nvim_set_hl 0 :BufferManagerModified { :fg :#add8e6 })
             nil)})

