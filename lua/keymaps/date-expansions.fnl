(local utils _G.vim.g.utils)
(local api _G.vim.api)
(local Keymaps utils.keymaps)
(Keymaps.noremap "ia" "sdate"
                 (fn []
                   (local date-str (os.date "%y%m%d" (os.time)))
                   (api.nvim_paste date-str false -1))
                 "Expands to date of form YYMMDD; used for filename prefixes")
(Keymaps.noremap "ia" "ldate"
                 (fn []
                   (local date-str (os.date "%Y-%m-%d" (os.time)))
                   (api.nvim_paste date-str false -1))
                 "Expands to date of form YYYY-MM-DD")
