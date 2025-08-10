-- [nfnl] lua/plugins/guess-indent-config.fnl
local guess_indent_config = {"NMAC427/guess-indent.nvim", keys = {{"<leader>ui", "<CMD>GuessIndent<CR>", desc = "Guess Indent", mode = "n"}}, opts = {auto_cmd = true, filetype_exclude = {"netrw", "tutor"}, buftype_exclude = {"help", "nofile", "terminal", "prompt"}, on_tab_options = {expandtab = false}, on_space_options = {expandtab = true, shiftwidth = "detected", softtabstop = "detected", tabstop = "detected"}, override_editorconfig = false}, lazy = false}
return guess_indent_config
