-- [nfnl] lua/plugins/gitsigns_config.fnl
local utils = vim.g.utils
local gitsigns_config = {"lewis6991/gitsigns.nvim", enabled = not utils.is_machmotion(), event = "VeryLazy", opts = {signs = {add = {text = "+"}, change = {text = "~"}, topdelete = {text = "\226\128\190"}}}}
do local _ = {text = "_"} end
do local _ = {text = "~"} end
return gitsigns_config
