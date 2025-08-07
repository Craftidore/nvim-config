(local utils _G.vim.g.utils)
(local Keymaps utils.keymaps)
(local api _G.vim.api)
(local g _G.vim.g)

(utils.defer.add_deferred
  (fn []
    (utils.keymaps.wk_add
      [{1 :<leader>u :group "Run [U]tility"}]))
  :which-key)

(Keymaps.noremap :n :<leader>uu :<NOP> "Util: Cancel util run without undo")
(Keymaps.noremap :n :<leader>uh :<CMD>nohl<CR>
                 "Util: Turn search [h]ighlighting off")

(Keymaps.noremap :n :<leader>ucl "mz?[a-z]<cr><cmd>nohl<cr>gul`z"
                 "[U]til: Lowercase latest upper[c]ase [l]etter")

(Keymaps.noremap :n :<leader>ua "mzggVG\"+y`z"
                 "Util: Copy [a]ll of the buffer to clipboard")

(utils.defer.add_deferred
  (fn []
    (utils.keymaps.wk_add
      [{1 :<leader>uw :group "Manage opt_local.text[w]idth"}]))
  :which-key)

(Keymaps.noremap :n :<leader>uwt
                 (fn []
                   (let [current-text-width (api.nvim_get_option_value :textwidth
                                                                       {:scope :local})]
                     (if (= current-text-width 0)
                         (api.nvim_set_option_value :textwidth g.text_width
                                                    {:scope :local})
                         (api.nvim_set_option_value :textwidth 0
                                                    {:scope :local}))))
                 "Toggle :set textwidth for current buffer")

(Keymaps.noremap :n :<leader>uwe
                 (fn []
                   (api.nvim_set_option_value :textwidth g.text_width
                                              {:scope :local}))
                 "Enable :set textwidth for current buffer")

(Keymaps.noremap :n :<leader>uwd
                 (fn []
                   (api.nvim_set_option_value :textwidth 0 {:scope :local}))
                 "Disable :set textwidth for current buffer")
