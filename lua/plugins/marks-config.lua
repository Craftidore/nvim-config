-- [nfnl] lua/plugins/marks-config.fnl
local marks_config = {"chentoast/marks.nvim", event = "VeryLazy", opts = {builtin_marks = {"<", ">"}, cyclic = true, refresh_interval = 250, sign_priority = {lower = 10, upper = 15, builtin = 8, bookmark = 20}, excluded_filetypes = {}, excluded_buftypes = {}, mappings = {}, default_mappings = false, force_write_shada = false}}
return marks_config
