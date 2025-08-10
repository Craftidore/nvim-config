-- [nfnl] lua/plugins/autoclose-config.fnl
local autoclose_config = {opts = {keys = {["$"] = {close = true, pair = "$$", enabled_filetypes = {"tex", "markdown"}, escape = false}, ["<"] = {escape = true, close = true, pair = "<>", enabled_filetypes = {"html", "xml"}}, ["'"] = {escape = true, pair = "''", close = false}, ["\""] = {escape = true, close = true, pair = "\"\"", disabled_filetypes = {"vim"}}}, options = {disable_filetypes = {"text"}, disable_when_touch = true, touch_regex = "[%w(%[{]", auto_indent = true, disable_command_mode = true, pair_spaces = false}}}
autoclose_config[1] = "m4xshen/autoclose.nvim"
return autoclose_config
