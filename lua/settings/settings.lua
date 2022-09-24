local api = vim.api
vim.cmd([[filetype plugin on
filetype indent on
]])

api.nvim_set_option("number", true)
api.nvim_set_option("relativenumber", true)

local tab_options = { "tabstop", "softtabstop", "shiftwidth" }
local tab_width = 4
for i = 1, #tab_options do
	api.nvim_set_option(tab_options[i], tab_width)
end
api.nvim_set_option("expandtab", true)
