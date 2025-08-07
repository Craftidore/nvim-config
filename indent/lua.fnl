(local vim _G.vim)
(local utils vim.g.utils)
(local lua-width (if (utils.is_machmotion) 4 2))

(tset vim.opt_local :expandtab true)
(tset vim.opt_local :shiftwidth lua-width)
(tset vim.opt_local :softtabstop lua-width)

; According to the docs, I should be setting b:undo_indent here, but it's getting set to something else and that's taking priority

